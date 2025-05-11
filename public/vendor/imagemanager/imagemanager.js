class ImageManager {

    constructor() {
        this.elements = false;
        this.files = [];
        this.config = {
            'element': false,
            'multiple': false,
            'targetInput': false,
            'callbacks': {
                'beforeOpen': false, 
                'afterOpen': false,
                'beforeClose': false,
                'afterClose': false,
                'beforeSelect': false,
                'afterSelect': false,
            },
            'types': {
                '': 'All type',
                'image': 'Image',
                'screenshot': 'Screenshot',
                'art': 'Art',
                'scan': 'Scan',
                'photo': 'Photo'
            },
            'gallery': {
                'maxPerPage': 10,
                'maxSelect': 5,
                'types': '*',
                'query': {
                    'url': '/api/images/get',
                    'conditions': {}
                },
                'update': {
                    'url': '/api/images/update',
                }
            },
            'upload': {
                'url': '/api/images/upload',
                'maxFiles': 50,
                'maxSize': 1024,
                'defaultType': 'image',
                'defaultTitle': '',
                'beforeUpload': false,
                'afterUpload': false,
            },
        };

        this.icons = {
            'add': 'fa-plus',
            'remove': 'fa-minus',
        }

        this.html = '';
        this.currentPage = 1;
        this.maxPage = 1;

        this.paginator = false;
        this.selectItems = [];
        this.instances = [];

        this.currentItem = false;
        this.items = [];
        this.filter = {
            'title': '',
            'type': '',
            'page': 1,
        };

        this.template = `
        <div class="image-manager">
            <div class="image-manager-wrapper">
                <div class="image-manager-main-content">
                <div class="image-manager-header">
                    <div class="image-manager-tabs">    
                        <span role="gallery" class="tab-link" data-target="gallery-tab"><i class="fa-solid fa-images"></i> Gallery</span>
                        <span role="upload" class="tab-link" data-target="upload-tab"><i class="fa-solid fa-download"></i> Upload</span>
                    </div>
                </div>
                    <div class="image-manager-content">
                        {{gallery}}
                        {{upload}}
                    </div>
                    <aside class="image-manager-panel"><div class="image-manager-panel-content"></div></aside>
                </div>
             
                <div class="image-manager-footer">
                    <div class="image-manager-actions">
                        <button class="image-manager-button" role="select">Select</button>
                        <button class="image-manager-button" role="cancel">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        `

        const typeOptions = Object.entries(this.config.types)
        .map(([key, label]) => `<option value="${key}">${label}</option>`)
        .join('');

        this.uploadTemplate = `
        <div id="upload-tab" class="image-manager-upload tab-content">
        <div class="image-manager-upload-form">
            <input name="title" type="text" placeholder="Title">
            <select name="type">${typeOptions}</select>
            <input name="keywords" type="text" placeholder="Keywords">
        </div>
            <div class="upload-dropzone" id="upload-dropzone">
                <p>Click or drag image files here to upload</p>
                <input type="file" name="files[]" multiple accept="image/*" hidden>
            </div>
            
            <div class="image-manager-upload-items">
                <div class="image-manager-upload-progress">
                    <div class="image-manager-upload-progress-bar"></div>
                </div>
                <div class="image-manager-upload-items-container"></div>
            </div>    
        </div>
        `;

        this.itemUploadedTemplate = `
            <div class="item-uploaded"></div>
        `
      
        this.galleryTemplate = `
        <div id="gallery-tab" class="image-manager-gallery tab-content">
            <div class="image-manager-gallery-filter">
                <input name="search" placeholder="Search">
                <select name="type">${typeOptions}</select>
                <button role="apply-filter">Apply</button>
                   <div class="image-manager-pagination">
                <button role="prev" class="prev"><i class="fa-solid fa-chevron-left"></i></button>
                <button role="next" class="next"><i class="fa-solid fa-chevron-right"></i></button>
            </div>
            </div>
            <div class="image-manager-gallery-items"></div>
         
        </div>
        `

        this.template = this.template.replace('{{gallery}}', this.galleryTemplate);
        this.template = this.template.replace('{{upload}}', this.uploadTemplate);

        this.itemTemplate = `
            <div id="{id}" class="image-manager-item">
            <div class="image-manager-item-wrapper">
                <img src="{src}" alt="{alt}" title="{title}">
                <div class="image-manager-item-actions">
                    <span role="item-trigger"><i class="fa-solid fa-plus"></i></span>
                </div>
                </div>
            </div>
        `;

    
        this.itemForm = `
            <div class="image-manager-item-image"></div>
            <div class="image-manager-item-form">
                <div class="image-manager-field">
                    <label for="">Title</label>
                    <input id="title" name="title" type="text">
                </div>
                <div class="image-manager-field">
                <label for="">Type</label>
                    <select id="type" name="type">${typeOptions}</select>
                </div>
                <div class="image-manager-field">
                    <label for="">Description</label>
                    <textarea id="description" name="description"></textarea>
                </div>
                <div class="image-manager-field">
                    <label for="">Keywords</label>
                    <input id="keywords" name="keywords" type="text">
                </div>
                <button role="update-item" class="image-manager-submit">Update</button>
        `;

        this.selectionTemplate = `
            <div class="image-manager-selection">
                <div class="image-manager-selection-wrapper">
                    <div class="image-manager-selection-header">
                        <h2>Selected items</h2>
                        <button role="clear-selection">Clear</button>
                        <div class="image-manager-selection-options">
                            <input type="description" type="text" placeholder="Description">
                        </div>
                    </div>
                    <div class="image-manager-selection-items"></div>
                </div>
            </div>
        `;
        this.selectionItemTemplate = `
            <div class="image-manager-selection-item">`;

        this.build();
    }



    build() {
        if (this.html) return;
    
        const wrapper = document.createElement('div');
        wrapper.innerHTML = this.template.trim();
    
        this.html = wrapper.firstElementChild;
        document.body.appendChild(this.html);

        this.html.querySelector('button[role="cancel"]').addEventListener('click', (event) => {
            this.close();
        });

        this.html.querySelector('button[role="select"]').addEventListener('click', (event) => {

            const result = this.config.multiple ? this.selectItems : this.currentItem;
            
            if (this.config.callbacks.beforeSelect)
                this.config.callbacks.beforeSelect(result);

            this.close();

            if (this.config.callbacks.afterSelect)
                this.config.callbacks.afterSelect(result);


        });


        this.html.querySelector('button[role="next"]').addEventListener('click', (event) => {
            
            if(this.currentPage < this.paginator.pages) {
                this.currentPage += 1;
                this.filter.page = this.currentPage;
                this.getItems();
            }

        });

        this.html.querySelector('button[role="prev"]').addEventListener('click', (event) => {
            
            if(this.currentPage > 1) {
                this.currentPage -= 1;
                this.filter.page = this.currentPage;
                this.getItems();
            }

        });

        this.html.querySelectorAll('.tab-link').forEach(tab => {
            tab.addEventListener('click', (event) => {
                // Retirer la classe 'tab-active' de tous les onglets
                this.html.querySelectorAll('.tab-link').forEach(el => {
                    el.classList.remove('tab-active');
                });

                // Ajouter 'tab-active' à l'onglet cliqué
                event.target.classList.add('tab-active');

                // Retirer la classe 'active' de tous les contenus
                this.html.querySelectorAll('.tab-content').forEach(content => {
                    content.classList.remove('active');
                });

                const panel = this.html.querySelector('.image-manager-panel');

                panel.classList.remove('is-hidden');

                // Ajouter 'active' au contenu associé à l'onglet cliqué
                const contentId = event.target.getAttribute('data-target');
             
                if (contentId == 'upload-tab')
                {
                    panel.classList.add('is-hidden');
                }
                else
                {
                    this.getItems();
                }
                this.html.querySelector(`#${contentId}`).classList.add('active');
            });
        });

        const dropzone = this.html.querySelector('#upload-dropzone');
        const input = dropzone.querySelector('input[type="file"]');

        

        // Clique = ouvrir la fenêtre
        dropzone.addEventListener('click', () => {
            input.click();
        });

        // Glisser un fichier sur le dropzone
        dropzone.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropzone.classList.add('dragover');
        });

        dropzone.addEventListener('dragleave', () => {
            dropzone.classList.remove('dragover');
        });

        dropzone.addEventListener('drop', (e) => {
            e.preventDefault();
            dropzone.classList.remove('dragover');

            const files = e.dataTransfer.files;
            handleUpload(files);
        });

        // Si fichiers choisis via fenêtre
        input.addEventListener('change', () => {
            handleUpload(input.files);
        });

        // Fonction d'upload
        const handleUpload = async (files) => {

            const form = this.html.querySelector('.image-manager-upload-form');

            const title = form.querySelector('input[name="title"]').value;
            const type = form.querySelector('select[name="type"]').value;
            const keywords = form.querySelector('input[name="keywords"]').value;

            
            let currentProgress = 0;
            let uploadedCount = 0;
            let uploaded = [];
            const maxProgress = 100 / files.length;
            const progressBar = this.html.querySelector('.image-manager-upload-progress-bar');
            const container = this.html.querySelector('.image-manager-upload-items-container');

            container.innerHTML = '';
            
            progressBar.setAttribute('style', 'width:0');

            for (let file of files) {
                const formData = new FormData();
                formData.append('file', file);
                formData.append('title', title);
                formData.append('type', type);
                formData.append('keywords', keywords);
        
                try {
                    const res = await fetch(this.config.upload.url, {
                        method: 'POST',
                        body: formData
                    });
        
                    const result = await res.json();
        
                    if (typeof this.config.upload.afterUpload === 'function') {
                        this.config.upload.afterUpload(result, file);
                    }
        

                    uploaded.push(result);
                    if(uploaded.length > 10)
                    {
                        uploaded.shift();
                        container.innerHTML = '';
                        uploaded.forEach(image => {
                            this.addUploadedImage(image);
                        });
                    } 
                    else {
                        this.addUploadedImage(result);
                    }   

                    
                    
                    currentProgress += maxProgress;
                    progressBar.setAttribute('style', 'width: ' + currentProgress + '%');

                    uploadedCount++;
                    
                } catch (err) {
                   alert(`Upload error for ${file.name}`, err);
                }
            }
        };

        // Filter
        this.html.querySelector('button[role="apply-filter"]').addEventListener('click', (event) => {
            this.currentPage = 1;
            const filter = this.html.querySelector('.image-manager-gallery-filter');
            this.filter.search = filter.querySelector('input[name="search"]').value;
            this.filter.type = filter.querySelector('select[name="type"]').value;
            this.getItems();
        });
        this.html.querySelector('input[name="search"]').addEventListener('keydown', (event) => {
            if(event.key == 'Enter')
            {
                this.currentPage = 1;
                const filter = this.html.querySelector('.image-manager-gallery-filter');
                this.filter.search = filter.querySelector('input[name="search"]').value;
                this.filter.type = filter.querySelector('select[name="type"]').value;
                this.getItems();
            }
        })

        this.buttonNext = this.html.querySelector('button[role="next"]');
        this.buttonPrev = this.html.querySelector('button[role="prev"]');
        
    }

    addUploadedImage(image) {
        const container = this.html.querySelector('.image-manager-upload-items-container');
        const imageContainer = document.createElement('div');
        imageContainer.classList.add('item-uploaded');

        const imgElement = document.createElement('img');
        imgElement.src = '/' + image.thumb;
        imgElement.alt = image.title;
        imageContainer.appendChild(imgElement);

        container.appendChild(imageContainer);
    }

  

    add(name, config = {}) {
        const finalConfig = Object.assign({}, this.config, config);
    
        this.instances[name] = finalConfig;

        if (!this.elements) this.elements = new Map();
    
        document.querySelectorAll(finalConfig.element).forEach(el => {
            this.elements.set(el, finalConfig);
    
            el.addEventListener('click', (e) => {
                e.preventDefault();
                this.open(name);
            });
        });
        
    }
    
    initialize() {
        this.build();
        document.body.appendChild(this.html);

        

    }

    open(name) {
        this.config = this.instances[name];
        this.getItems();
        this.html.querySelector('[role="gallery"]').classList.add('tab-active');
        this.html.querySelector('#gallery-tab').classList.add('active');

        this.html.classList.add('active');

        
    }

    close() {
        this.html.classList.remove('active');
    }

    filter() {

    }

    insertItem(selector, index) {
        const image = this.items[index];
        let itemHtml = this.itemTemplate
            .replace('{id}', image.id)
            .replace('{src}', '/' + image.thumb)
            .replace('{alt}', image.description)
            .replace('{title}', image.title);

      
        const selected = this.selectItems.some(item => item.id == image.id);
    
        // Convertir le HTML string en Node
        const temp = document.createElement('div');
        temp.innerHTML = itemHtml.trim(); // trim pour éviter les espaces indésirables
        const element = temp.firstChild;

        if(selected) {
            element.querySelector('[role="item-trigger"] i').classList.remove('fa-plus');
            element.querySelector('[role="item-trigger"] i').classList.add('fa-minus');
            element.classList.add('selected');
        }
    
        // Ajouter l'élément à la galerie
        this.html.querySelector(selector).appendChild(element);
    
        // Ajouter l'écouteur d'événement
        element.addEventListener('click', (event) => {
            this.html.querySelectorAll('.image-manager-item').forEach((item, i) => {
                item.classList.remove('active');
            });
            
            element.classList.add('active');
            this.selectItem(image);
        });

        element.querySelector('[role="item-trigger"]').addEventListener('click', (event) => {
            event.preventDefault();
            event.stopPropagation();
            const el = event.target;
            const icon = el.closest('i') || el;
           
            
            if (element.classList.contains('selected')) {
                element.classList.remove('selected');
                this.selectItems = this.selectItems.filter(item => item.id !== image.id);

                icon.classList.remove('fa-minus');
                icon.classList.add('fa-plus');

            } else {
                element.classList.add('selected');
                this.selectItems.push(image);

                icon.classList.remove('fa-plus');
                icon.classList.add('fa-minus');
            } 
        });

    }

    selectItem(item) {


        this.currentItem = item;

        const panel = this.html.querySelector('.image-manager-panel-content');
        panel.innerHTML = this.itemForm;
    


        const title = panel.querySelector('input[name="title"]');
        const type =  panel.querySelector('select[name="type"]');
        const description = panel.querySelector('textarea[name="description"]');
        const keywords = panel.querySelector('input[name="keywords"]');


        title.value = item.title;
        description.value = item.description;
        type.value = item.type;
        keywords.value = item.keywords;

        const button = panel.querySelector('button[role="update-item"]');
        button.classList.remove('valid');
        button.addEventListener('click', (event) => {
            event.preventDefault();
    
            const data = {
                id: item.id,
                title: panel.querySelector('input[name="title"]').value,
                type: panel.querySelector('select[name="type"]').value,
                description: panel.querySelector('textarea[name="description"]').value,
                keywords: panel.querySelector('input[name="keywords"]').value,
            };
    
            fetch(this.config.gallery.update.url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(result => {
                
                item.title = result.title;
                item.description = result.description;
                item.type = result.type;
                item.keywords = result.keywords;

                this.items[item.index] = item;
                button.classList.add('valid');
                
            })
            .catch(error => {
                console.error('Update error:', error);
            });
        });
    }

    getItems() {

        this.items = [];
        this.html.querySelector('.image-manager-gallery-items').innerHTML = '';


        fetch(this.config.gallery.query.url + '?page=' + this.currentPage, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(this.filter)
        })
        .then(response => response.json())
        .then(data => {

        
            const items = data.items;
            this.paginator = data.paginator;

            

            this.currentPage = this.paginator.page;

            if(this.currentPage == this.paginator.pages)
            {
                this.buttonNext.disabled = true;
            }
            else
            {
                this.buttonNext.disabled = false;
            }

            if (this.currentPage > 1 && this.currentPage <= this.paginator.pages) {

                this.buttonPrev.disabled = false;
            }
            else {
                this.buttonPrev.disabled = true;
            }

            items.forEach((image, index) => {
                image.index = index;
                this.items.push(image);
                this.insertItem('.image-manager-gallery-items', index);
            });
        })
        .catch(error => console.error('Erreur de chargement des images:', error));
    }

}