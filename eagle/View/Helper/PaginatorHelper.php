<?php 
namespace Eagle\View\Helper;

use Eagle\View\Helper;

use Eagle\Request;
use Eagle\Utility\Inflector;

class PaginatorHelper extends Helper
{
    public array $meta = [];
    protected $request;


    public function initialize(array $config = []): void
    {
        parent::initialize($config);
        $this->request = $this->view->request;
    }



    public function prev(string $label = '← Précédent'): ?string
    {
        if (!empty($this->meta['hasPrev'])) {
            $prevPage = $this->meta['page'] - 1;
            return sprintf('<a href="?page=%d">%s</a>', $prevPage, $label);
        }
        return null;
    }

    public function next(string $label = 'Suivant →'): ?string
    {
        if (!empty($this->meta['hasNext'])) {
            $nextPage = $this->meta['page'] + 1;
            return sprintf('<a href="?page=%d">%s</a>', $nextPage, $label);
        }
        return null;
    }

    public function numbers(array $options = []): string
    {
        if (($this->meta['pages'] ?? 1) < 2) {
            return '';
        }

        $default = [
            'containerClass' => 'pagination-list',
            'itemClass' => 'pagination-link',
            'activeClass' => 'is-current'
        ];

        $options = array_merge($default, $options);

        $html = '<ul class="' . $options['containerClass'] . '">{{content}}</ul>';

        $page = $this->meta['page'] ?? 1;
        $pages = $this->meta['pages'] ?? 1;

        $query = $this->request->getQuery();
    
    
        unset($query['page']);

        if(!empty($query))
            $urlBase = '?' . http_build_query($query) . '&';
        else
            $urlBase = '?';
    

        $items = [];
        for ($i = 1; $i <= $pages; $i++) {
            $class = $options['itemClass'];
            if ($i == $page) {
                $class .= ' ' . $options['activeClass'];
            }
    
            // Ajouter le paramètre 'page' à l'URL
            $url = $urlBase . 'page=' . $i;
    
            // Construire le lien de la page
            $items[] = sprintf(
                '<li><a href="%s" class="%s">%d</a></li>',
                $url,
                $class,
                $i
            );
        }

        $content = implode('', $items);
        $html = str_replace('{{content}}', $content, $html);

        return $html;
    }


    public function counter(): string
    {
        return sprintf(
            'Page %d sur %d (Total : %d)',
            $this->meta['page'] ?? 1,
            $this->meta['pages'] ?? 1,
            $this->meta['total'] ?? 0
        );
    }

    public function meta(): array
    {
        return $this->meta;
    }

    public function order(string $field, array $args = []): string
    {
        $currentSort = $this->request->getQuery('sort');
        $currentDirection = $this->request->getQuery('direction') ?? 'asc';

        $icon = '';
        $class = '';
        $newDirection = 'asc';
        if ($currentSort === $field) {
            $icon = '<span class="icon"><i class="fa-solid fa-chevron-{{direction}}"></span>';
            if($currentDirection === 'asc')
            {
                $newDirection = 'desc';
            }

            $direction = $newDirection == 'asc' ? 'down' : 'up';
            $icon = str_replace('{{direction}}', $direction, $icon);
            $class = ' class="sort-active"';
        }



        $url = $this->request->buildQueryUrl([
            'sort' => strtolower($field),
            'direction' => $newDirection,
            'page' => 1
        ]);


        if (isset($args['label']))
            $label = $args['label'];
        else
        {

            $labelField = $field;
            $name = $field;
            if (str_contains($labelField, '.')) {
                [$name,] = explode('.', $labelField, 2); // on garde juste la colonne pour l'affichage
            }

            $label = str_replace(['_id', '_'], [' ', ' '], ucfirst($name));
        }

        return sprintf('<a href="%s"%s>%s%s</a>', $url, $class, $label, $icon);

    }
}
