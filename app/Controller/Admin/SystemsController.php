<?php

namespace App\Controller\Admin;

use App\Controller\AppController;

use Eagle\Exceptions\NotFoundException;

class SystemsController extends AppController {

    public function initialize()
    {
        parent::initialize();
    }

    public function index()
    {

        $query = $this->Systems->findAll();
        $systems = $this->Paginator->paginate($query);

        $this->set('systems', $systems);
    }



}