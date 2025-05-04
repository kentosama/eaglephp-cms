<?php

namespace Eagle\Controller;

use Eagle\Request;
use Eagle\View\View;

class Component {

    protected $config = [];
    protected $request;
    protected $view;

    public function __construct(View $view)
    {
        $this->view = $view;
        $this->initialize();

    }

    public function initialize()
    {
        $this->request = $this->view->request;
    }

    public function beforeFilter()
    {

    }


}