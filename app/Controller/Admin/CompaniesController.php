<?php

namespace App\Controller\Admin;

use App\Controller\AppController;

use Eagle\Exceptions\NotFoundException;

class CompaniesController extends AppController {

    public function initialize()
    {
        parent::initialize();
    }

    public function index()
    {

        $query = $this->Companies->find('all');
        $companies = $this->Paginator->paginate($query);

        $this->set('companies', $companies);
    }



}