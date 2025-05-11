class Autocomplete {
    constructor(config = {}) {
        this.config = Object.assign({
            container: '.autocomplete',
            id: 'dropdown-menu',
            query: '/api/companies/search',
            conditions: {},
            field: 'name',
            maxResults: 5,
            template: {
                'container': '<div class="autocomplete-container">{{content}}</div>',
                'content': '<div class="autocomplete-content"></div>',
                'itemClass': 'autocomplete-item',
            }
        }, config);

        

        this.results = [];
        this.container = document.querySelector(this.config.container)
        
        if(this.container == null)
            return;

        this.menu = document.querySelector('.dropdown-menu');
        this.input = this.container.querySelector('input[role="autocomplete"]');
        this.content = '';
        this.initialize();
    }

    initialize() {

        if (!this.config.id)
            this.config.id = 'autocomplete-' + Date.now() + '-' + Math.floor(Math.random() * 1000);

        var container = this.config.template['container'];
        var content = this.config.template['content'];

        container = container.replace('{{id}}', this.config.id);

        var html = container.replace('{{content}}', content);

        this.container.insertAdjacentHTML('beforeend', html);
        this.input.addEventListener('input', (e) => this.handleInput(e));
        
    }

    hide() {
        this.container.querySelector('.autocomplete-container').classList.remove('is-active');
    }

    show() {
        this.container.querySelector('.autocomplete-container').classList.add('is-active');
    }

    clear()
    {
        this.container.querySelector('.autocomplete-content').innerHTML = '';
    }

    selectItem(item)
    {
        var input = this.container.querySelector('input[type="hidden"]');
        
        input.setAttribute('value', item.id)
        
        this.input.value = item.name;

        this.hide();

    }

    handleInput(e) {
        const query = e.target.value;

        // On vérifie qu'il y a bien un texte
        if (query.length >= 2) {
            this.fetchData(query);
        }
        else
        {
            this.clear();
            this.hide();
        }
    }

    async fetchData(query) {
        try {
            // Préparation des données
            const q = {
                'name': query,
                'conditions': JSON.stringify(this.config.conditions)
            };
    
            // Envoi de la requête POST
            const response = await fetch(this.config.query, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(q)  // Utilisation de 'q' et non de 'data'
            });
    
            // Vérification de la réponse
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
    
            // Traitement des données reçues
            const data = await response.json();
    
            if (data.length === 0) {
                this.clear();
                this.hide();
                return;
            }
    
            // Afficher les résultats dans l'UI
            this.results = data.map(item => ({
                value: item.id,
                label: item.name
            }));
    
            this.renderResults(data);
        } catch (error) {
            console.error('Il y a eu un problème avec la requête fetch:', error);
        }
    }
    

    renderResults(data) {
       
        var content = this.container.querySelector('.autocomplete-content');
        content.innerHTML = '';
        data.forEach(item => {
            const a = document.createElement('a');
            a.textContent = item.name;
            a.dataset.id = item.id;
            a.setAttribute('class', this.config.template['itemClass']);
            a.addEventListener('click', () => this.selectItem(item));
            content.appendChild(a);
        });
    
        this.show();
    }
    
}
