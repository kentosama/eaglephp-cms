<?php

namespace Eagle\View;

use Eagle\ErrorException as EagleErrorException;
use Eagle\Request;
use Eagle\Utility\Inflector;
use Eagle\View\Helper\HtmlHelper;
use Eagle\View\Helper\PaginatorHelper;
use Eagle\View\Helper\FormHelper;
use ErrorException;

use Eagle\View\Cell;
use Eagle\View\Helper\ShortCodeHelper;

use Eagle\View\Helper\TextHelper;

class View {

    public $request;

    public array $vars = [];
    protected array $helpers = [];
    public string $layout;
    public string $template;
    public array $blocks = [];

    public string $currentLayout;


    public function __construct()
    {
        $this->request = new Request;
        $this->layout = 'default';
        $this->currentLayout = $this->layout;

        $this->initialize();
       
    }
    
    protected function initialize() 
    {
        $this->helpers['html'] = new HtmlHelper($this);
        $this->helpers['form'] = new FormHelper($this);
        $this->helpers['text'] = new TextHelper($this);
        $this->helpers['shortcode'] = new ShortCodeHelper($this);
        $this->helpers['paginator'] = new PaginatorHelper($this);
    }

    public function __get($name): mixed
    {
        if(isset($this->helpers[$name]))
            return $this->helpers[$name];

        return null;
    }

    public function extend(string $layout)
    {
        $this->currentLayout = $layout;
    }

    public function append(string $name, string $content) 
    {
        if (!isset($this->blocks[$name])) {
            $this->blocks[$name] = '';
        }
    
        $this->blocks[$name] .= $content;
    }

    public function prepend(string $name, $content = null)
    {
        if (!isset($this->blocks[$name])) {
            $this->blocks[$name] = '';
        }
    
        $this->blocks[$name] = $content . $this->blocks[$name];
    }

    public function assign(string $name, mixed $value = null): void
    {
        $this->vars[$name] = $value;
    }

    public function fetch(string $name): mixed
    {
        return $this->blocks[$name] ?? '';
    }

    private function content(): void
    {
        $prefix = $this->request->getParams('prefix');
        $controller = Inflector::classify($this->request->getParams('controller'));

        $filename = $prefix ? TEMPLATE_DIR . DS . ucfirst($prefix) . DS . $controller . DS . $this->template . '.php' : TEMPLATE_DIR  . DS . $controller . DS . $this->template . '.php';

        if(!file_exists($filename))
            $this->renderError("Template not found: {$filename}.");

        extract($this->vars);
        include $filename;
    }

    public function render(): void
    {
        if ($this->layout) {
            
            $filename = TEMPLATE_DIR . DS . 'Layouts' . DS . $this->layout . '.php';

            if(!file_exists($filename))
                $this->renderError("Layout not found: {$filename}");

            extract($this->vars);
            include $filename;
        } else {
            $this->content();
        }

        unset($_SESSION['errors']);
    }

    public function element($name, ?array $vars = []): void
    {
        $template = TEMPLATE_DIR . DS . 'Elements' . DS . $name . '.php';
        if(!file_exists($template))
            throw new ErrorException("Element template not found: {$template}");

        extract($vars);
        include $template;
    }

    public function cell($name): void
    {
        $class = "\\App\\View\\Cell\\{$name}Cell";

        if(!class_exists($class))
            throw new EagleErrorException("Cell class not exists : {$class}");

        $cell = new $class();

        $cell->setView($this);
        $cell->display();
        $cell->render();
    }

    public function renderError(string $message): void
    {
        error_log($message);
        $e = new ErrorException($message);
        include TEMPLATE_DIR . DS . 'Layouts' . DS . 'error.php';
        exit();
    }






}