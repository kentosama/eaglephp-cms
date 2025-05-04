<?php
 
namespace App\Controller;

use Eagle\Controller\Controller;

class AppController extends Controller
{

    protected function initialize() {
        parent::initialize();

        $this->loadComponent('Paginator');
    }

    public function beforeRender()
    {
        parent::beforeRender();
        
        $prefix = $this->request->getParams('prefix');
        
        if($prefix == 'admin') {
            $this->view->layout = 'admin';
          
        }

    }

}