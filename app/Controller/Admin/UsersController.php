<?php

namespace App\Controller\Admin;

use App\Controller\AppController;


class UsersController extends AppController 
{

    public function initialize()
    {
        parent::initialize();
    }
    
    public function index(): void
    {
        $query = $this->Users->findAll();

        $users = $this->Paginator->paginate($query);

        $this->set('users', $users);
    }
    
    public function add(): void
    {
        $user = $this->Users->createEntity();

        if($this->request->is('POST')) {
            $user = $this->Users->patchEntity($user, $this->request->getData());

            if($this->Users->save($user))  {
                $this->redirect(['action' => 'index']);
            }
        }

        $this->set('user', $user);
    }

    public function edit($id): void
    {
        $user = $this->Users->findById($id)->read();

        if($this->request->is('POST')) {
            $user = $this->Users->patchEntity($user, $this->request->getData());
            if($this->Users->save($user))  {
                $this->redirect(['action' => 'index']);
            }
        }

        $this->set('user', $user);
    }
}