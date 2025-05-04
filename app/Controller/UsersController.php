<?php

namespace App\Controller;
use Eagle\Controller\Controller;

class UsersController extends AppController {

    public function index()
    {
        $query = $this->Users->findAll()->contain(['Articles' => function($q) { 
            return $q->contain(['Images', 'Tags'])->limit(8)->order('Articles.id', 'ASC'); 
        }]);

        $users = $query->readAll();

        $this->set('users', $users);
    }

}