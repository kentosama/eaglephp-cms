<?php

namespace Eagle\View;

use Eagle\ErrorException as EagleErrorException;
use ErrorException;
use Eagle\ORM\Query;

class Cell {


    protected $vars= [];
    protected $view;

    public function __construct()
    {
        $this->initialize();
    }

    public function initialize() 
    {

    }

    public function __get($name): mixed
    {
        if(!empty($this->view)) {
            return $this->view->$name;
        }

        return null;
    }

    protected function set(string $name, mixed $value): void
    {
        $this->vars[$name] = $value;
    } 

    public function display() 
    {

    }

    public function setView(View $view): void
    {
        $this->view = $view;
    }

    protected function getTemplateFile(): string
    {
        $name = (new \ReflectionClass($this))->getShortName();
        $name = substr($name, 0, -4); // retire 'Cell'
        return TEMPLATE_DIR . DS . 'Cell' . DS . $name . DS . 'display.php';
    }


    public function render()
    {
        foreach($this->vars as $key => $value) {
            if ($value instanceof Query) {
                
                $this->vars[$key] = $value->read();
            }
        }

        $template = $this->getTemplateFile();
        
        if(!file_exists($template))
            throw new EagleErrorException("Cell template not found: {$template}");

        extract($this->vars);
        include $template;
    }
}