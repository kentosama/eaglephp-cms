<?php 

namespace Eagle;

use Eagle\Utility\Inflector;
use Eagle\Exceptions\NotFoundException;
use Eagle\View\View;

class Dispatcher {

    private $request;
    private $view;


    public function __construct()
    {
        $this->request = new Request();
        $this->view = new View();
    }

    public function dispatch() 
    {
        try {
            $params = $this->request->getParams();

            $controller = Inflector::classify($params['controller'] ?? 'Pages');
            $action = $params['action'] ?? 'index';
            $prefix = isset($params['prefix']) ? ucfirst($params['prefix'].'\\')  : '';
            if($prefix == '\\') $prefix = '';
            $pass = $params['pass'] ?? [];

            $controllerClass = "\\App\\Controller\\{$prefix}{$controller}Controller";

            if (!class_exists($controllerClass)) {
                throw new NotFoundException("Contrôleur introuvable : $controllerClass");
            }

            $instance = new $controllerClass();

            if (!method_exists($instance, $action)) {
                throw new NotFoundException("Méthode {$action} non trouvée dans $controllerClass");
            }

            $instance->view->template = $action;

            call_user_func([$instance, 'beforeFilter']);
            call_user_func_array([$instance, $action], $pass);
         
            call_user_func([$instance, 'beforeRender']);
            $instance->view->render();
        } catch (\Eagle\Exceptions\NotFoundException $e) {
            // Gestion des erreurs 404 (Not Found)
            $this->handleNotFoundError($e);
        }
    }

    private function handleNotFoundError(NotFoundException $e) {

        if(APP_DEBUG === true) {
            $this->view->renderError($e->getMessage());
        }

    }

}