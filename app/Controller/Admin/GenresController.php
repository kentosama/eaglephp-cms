<?php

namespace App\Controller\Admin;

use App\Controller\AppController;


class GenresController extends AppController 
{

    public function initialize()
    {
        parent::initialize();
    }
    
    public function index(): void
    {
        $query = $this->Genres->findAll();

        $genres = $this->Paginator->paginate($query);

        $this->set('genres', $genres);
    }
    
    public function add(): void
    {
        $genre = $this->Genres->createEntity();

        if($this->request->is('POST')) {
            $genre = $this->Genres->patchEntity($genre, $this->request->getData());

            if($this->Genres->save($genre))  {
                $this->redirect(['action' => 'index']);
            }
        }

        $this->set('genre', $genre);
    }

    public function edit($id): void
    {
        $genre = $this->Genres->findById($id)->read();

        if($this->request->is('POST')) {
            $genre = $this->Genres->patchEntity($genre, $this->request->getData());
            if($this->Genres->save($genre))  {
                $this->redirect(['action' => 'index']);
            }
        }

        $this->set('genre', $genre);
    }
}