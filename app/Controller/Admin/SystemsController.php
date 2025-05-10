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

    public function add()
    {
        $system = $this->Systems->createEntity();

        $this->set('system', $system);
    }

    public function edit(int $id): void
    {
        $system = $this->Systems->findById($id)->read();
        if($this->request->is('POST')) {
            $system = $this->Systems->patchEntity($system, $this->request->getData());

            if($this->Systems->save($system)) {
                $this->redirect(['action' => 'index']);
            }
        }

        $this->set('system', $system);
    }



}