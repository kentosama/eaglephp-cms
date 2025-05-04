<?php

namespace Eagle\View;
use Eagle\View\View;

class Helper {

    protected $default = [];
    protected $config = [];
    protected $view;
    protected $params;

    public function __construct(View $view, array $config = []) {
        $this->view = $view;
        $this->initialize($config);
    }

    public function initialize(array $config = []): void
    {
        $this->config = array_merge($this->default, $config);
        $this->params = $this->view->request->getParams();
    }

}