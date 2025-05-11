<?php

namespace App\Controller\Admin;

use App\Controller\AppController;

use Eagle\Exceptions\NotFoundException;

class GamesController extends AppController {

    public function initialize()
    {
        parent::initialize();
    }

    public function index()
    {

        $query = $this->Games->findAll()
        ->contain(['Genres', 'Images', 'Publishers', 'Developers', 'Systems']);
        $games = $this->Paginator->paginate($query);

        $this->set('games', $games);
    }



}