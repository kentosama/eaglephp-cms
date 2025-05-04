<?php

namespace Eagle\Controller;
use Eagle\View\View;
use Eagle\Request;
use Eagle\ORM\Query;
use Eagle\ORM\TableRegistry;
use ErrorException;

use Eagle\Router;

class Controller {

    private $related = [];
    public $request;
    public $view;
    protected $components = [];

    public function __construct()
    {
        $this->initialize();
    }

    protected function initialize()
    {
        // Exemple : App\Controller\ArticlesController
        $controllerClass = get_class($this);

        // On isole "Articles" depuis "ArticlesController"
        $baseName = basename(str_replace('\\', '/', $controllerClass));
        $modelName = str_replace('Controller', '', $baseName);

        // On construit le nom de la classe de la table
        $tableClass = "\\App\\Model\\Table\\{$modelName}Table";

        

        if (class_exists($tableClass)) {
            $this->related[$modelName] = new $tableClass();
        }

        $this->view = new View();
        $this->request = new Request();
    }

    public function loadComponent(string $component, array $config = []) 
    {
       
        $className = 'Eagle\Controller\Component\\' . $component . 'Component';

        if (class_exists($className))
        {
            $this->related[$component] = new $className($this->view, $config);
            $this->components[$component] = $this->related[$component];
        }
        else {

            throw new ErrorException("Component class '$className' not found.");
        }
    }

    public function __get($name): mixed 
    {
        if(isset($this->related[$name]))
        return $this->related[$name];

        return null;
    }

    protected function set(string $name, mixed $value) {

        

        $this->view->vars[$name] = $value;
    }

    public function beforeFilter()
    {

    }

    public function beforeRender()
    {

        foreach($this->components as $component)
        {
            $component->beforeRender();
        }

        foreach($this->view->vars as $key => $value) {
            if ($value instanceof Query) {
                
                $this->view->vars[$key] = $value->read();
            }
        }
    }

    public function redirect(array $url): void
    {
        $args = [
            'prefix' => $this->request->getParams('prefix'),
            'controller' => $this->request->getParams('controller'),
            'action' => $this->request->getParams('action'),
        ];

        $queryParams = $this->request->getQuery();
        
        $url = array_merge($args, $url);
        
        if (in_array($args['action'], ['add', 'edit', 'update'])) {
            $url = array_merge($url, $queryParams);
        }

        $url = Router::buildUrl($url);
       
        header('Location: ' . $url);
        exit();
    }
    
}