

const imageManager = new ImageManager();

const editor = new EasyMDE({
    element: document.querySelector('.markdown-editor'),
    minHeight: "600px",
    maxHeight: "600px",
    toolbar: [
        'bold','italic','strikethrough','heading','code','quote', '|', 'link',
        {
            name: 'image',
            title: 'Image',
            className: 'fa fa-image',
            action: function (editor) {
                imageManager.open('image-insert');
            }
        },
    
    ]
});

imageManager.add('image-insert', {
    'element': 'button[role="image-manager"]',
    'multiple': true,
    'callbacks': {
        'afterSelect': function (images) {
            console.log(images);
            let cm = editor.codemirror;
            let doc = cm.getDoc();
            let cursor = cm.getCursor();

            let content = '';

            if (images.length > 1) {
                content = '{{< images >}}\n'; // Démarrer la section d'images

                images.forEach(function(image) {
                    content += `{{< image id="${image.id}" >}}\n`; // Ajoute chaque shortcode
                });

                content += '{{< /images >}}\n'; // Terminer la section d'images
            } else {
                let image = images[0];
                content = `{{< image id="${image.id}" >}}\n`; // Générer le shortcode de l'image unique
            }

            doc.replaceRange(content, cursor);
        }
    }
});


flatpickr.localize(flatpickr.l10ns.fr);
flatpickr(".datetimepicker", {
    'locale': 'fr',
    'enableTime': true,
    'dateFormat': 'd-m-Y H:i',
});

const autocompleteConfigs = [
    { container: '.autocomplete-company', query: '/admin/companies/search' },
    { container: '.autocomplete-publisher', query: '/admin/companies/search', conditions: {'is_publisher': true} },
    { container: '.autocomplete-developer', query: '/admin/companies/search', conditions: {'is_developer': true} }
];

autocompleteConfigs.forEach(config => {
    new Autocomplete(config);
});


const form = document.querySelector('form.filter');
if (form) {
    form.addEventListener('submit', function (e) {
        const inputs = form.querySelectorAll('input, select');
        inputs.forEach(input => {
            if (!input.value) {
                input.disabled = true;
            }
        });
    });

    inputs = form.querySelectorAll('input[type="text"]');
    inputs.forEach(element => {
        element.setAttribute('autocomplete', 'off');
    });
}


document.addEventListener('DOMContentLoaded', function () {
    // Sélectionne tous les éléments .file-input
    const fileInputs = document.querySelectorAll('.file-input');

    fileInputs.forEach(input => {
        input.addEventListener('change', function () {
            const fileNameSpan = this.closest('.file').querySelector('.file-name');
            if (this.files.length > 0) {
                fileNameSpan.textContent = this.files[0].name;
                
            } else {
                fileNameSpan.textContent = '';
            }
        });
    });
});




imageManager.add('manager', {'element': 'button[role="image-manager"]'});
imageManager.add('image-featured', {
    'element': '#image-featured',
    'multiple': false,
    'callbacks': {
    'afterSelect': function(image) {
        const img = document.getElementById('featured-image-preview');
        const input = document.getElementById('image_id');
        img.setAttribute('src', '/' + image.thumb);
        input.value = image.id;
    }
    }
});

tag = new TagInput('.tag-input', {
    'query': '/admin/tags/search',
    'conditions': {},
    'field': 'name',
    'maxResults': 5,
    'minKeywordLength': 2,
});