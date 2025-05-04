<?php
namespace App\Controller\Admin;

use App\Controller\AppController;
class TagsController extends AppController {

    public function initialize(): void
    {
        parent::initialize();
        $this->set('title', 'Article Types');
    }

    public function index(): void
    {
        $query = $this->Tags->findAll();

        $tags = $this->Paginator->paginate($query);

        $this->set('tags', $tags); 
        $this->set('description', 'Tag list');
    }

    public function add(): void 
    {
        $tag = $this->Tags->createEntity();

        if ($this->request->is('POST')) {
            $data = $this->request->getData();
            $tag = $this->Tags->patchEntity($tag, $data);
            
            if($this->Tags->save($tag))
                $this->redirect(['action' => 'index']);
        }

        $this->set('tag', $tag);

        $this->set('description', 'Add new tag');
    }

    public function edit(int $id) 
    {
        $tag = $this->Tags->findById($id)->read();

        if ($this->request->is('POST')) {
            $data = $this->request->getData();
            $tag = $this->Tags->patchEntity($tag, $data);
            
            if($this->Tags->save($tag))
                $this->redirect(['action' => 'index']);
        }
 
        $this->set('tag', $tag);

        $this->set('description', 'Edit tag');
    }

    public function delete(int $id): void
    {
        
    }

}