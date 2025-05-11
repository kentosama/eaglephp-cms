class TagInput {

    constructor(selector, config= {}) {

        this.config = Object.assign({
            id: 'tag-input',
            query: '/admin/tags/search',
            conditions: {},
            field: 'name',
            maxResults: 5,
            minKeywordLength: 2,
        }, config);

        this.elements = document.querySelectorAll(selector);
        
        this.items = [];
        this.results = [];

        this.elements.forEach(element => {
            this.init(element)
        });

    }

    init(element) {

        var input = element.querySelector('input[role="tag-input"]');

        element.querySelectorAll('.tag-input-item').forEach(item => {
            item.addEventListener('click', () => {
                const inputTags = element.querySelector('input#tags');
                let values = inputTags.value.split(',').filter(Boolean);
                
                const item_id = item.getAttribute('data-id');
                values = values.filter(id => id != item_id);
                inputTags.value = values.join(','); 
                item.remove();
                
            });
        });

        input.addEventListener('input', (e) => this.handleInput(element, e.target));
        input.addEventListener('keydown', (e) => {
            if (e.key === ',' || e.key === 'Enter') {
                e.preventDefault();
                const rawValue = input.value.trim().replace(/,$/, '');
                if (rawValue !== '') {
                    this.addTag(element, { id: null, [this.config.field]: rawValue });
                }
            }
        });
       
    }

    handleInput(element, input)
    {
       
        let value = input.value;
        if (value.length < this.config.minKeywordLength) {
            this.clear(element);
            return;
        }

        
        this.fetchResults(element, value);
    }

    clear(element)
    {
        this.results = [];
        this.hide(element);
    }

    show(element) {
        const container = element.querySelector('.tag-input-results');
        
        if (!container.classList.contains('active')) {
            container.classList.add('active');
        }
    }

    hide(element) { 
        const container = element.querySelector('.tag-input-results');
        container.classList.remove('active');
    }

    addTag(element, item) {

        const input = element.querySelector('input[role="tag-input"]');
        const container = element.querySelector('.tag-input-container');

        const inputTags = element.querySelector('input#tags');
        let values = inputTags.value.split(',').filter(Boolean);

        const span = document.createElement('span');
        span.className = 'tag-input-item';
        span.textContent = item[this.config.field];
        span.setAttribute('data-id', item.id);
        span.addEventListener('click', () => {
            values = values.filter(id => id != item.id);
            inputTags.value = values.join(','); 
            span.remove();
        });

        container.insertBefore(span, input);
        inputTags.value = values.concat(item.id).join(',');

        this.items.push(item);
        input.value = '';
        this.clear(element);

    }

    renderResults(element, data) {
        
        const container = element.querySelector('.tag-input-results');
        container.innerHTML = '';

        data.forEach(item => {
            const span = document.createElement('span');
            span.className = 'tag-input-result';
            span.textContent = item[this.config.field];
            span.setAttribute('data-id', item.id);
            span.addEventListener('click', () => {
                this.addTag(element, item);
                this.hide(element);
            });
            container.appendChild(span);
        });

        if (data.length > 0) {
            this.show(element);
        }
        else {
            this.hide(element);
        }
    }

    fetchResults(element, value) {

        const values = element.querySelector('input#tags').value;

        const url = this.config.query + '?' + this.config.field + '=' + value + '&' + 'limit=' + this.config.maxResults + '&' + 'exclude=' + values;
        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        })
        .then(response => response.json())
        .then(data => {
            this.results = data;
            this.renderResults(element, data);
        })
        .catch(error => {
            console.error('Error fetching results:', error);
         });
    }



}