<?php

namespace Eagle\Controller\Component;

use Eagle\Controller\Component;
use Eagle\ORM\Query;
use Eagle\Utility\Inflector;
use Eagle\View\Helper\Paginator;



class PaginatorComponent extends Component
{
    protected $config = [
        'limit' => 15
    ];

    protected $page;
    protected $total;
    protected $offset;
    protected $limit;
    protected $query;
    protected $helper;
    protected $isPagined;


    public function initialize()
    {
        parent::initialize();

        $this->isPagined = false;
        
    }

    public function paginate(Query $query, array $args = []) 
    {

        $args = array_merge($this->config, $args);

        $sort = $this->request->getQuery('sort');
        if(!is_null($sort))
        {
            $direction = $this->request->getQuery('direction');

            $direction = in_array($direction, ['asc', 'desc']) ? $direction : 'asc';
            
            $alias = $query->getAlias();

            $query->order("{$alias}.{$sort}", strtoupper($direction));
        }
        
        $this->limit = $args['limit'];
        $this->total = $query->count();
        $this->page = max(1, (int) ($this->request->getQuery('page') ?? 1));
        $this->offset = ($this->page - 1) * $this->limit;
        $this->query = $query->limit($this->limit)->offset($this->offset);
        $this->isPagined = true;
        return $query;
    }

    public function meta(): array
    {
        $pages = 0;
        
        if($this->limit)
            $pages = (int) ceil($this->total / $this->limit);

        return [
            'page' => $this->page,
            'limit' => $this->limit,
            'total' => $this->total,
            'pages' => $pages,
            'hasNext' => $this->page < $pages,
            'hasPrev' => $this->page > 1
        ];
    }

    public function beforeRender() 
    {
        $this->view->paginator->meta = $this->meta();
    }
} 