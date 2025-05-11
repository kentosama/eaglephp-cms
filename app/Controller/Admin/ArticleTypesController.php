<?php
namespace App\Controller\Admin;

use App\Controller\AppController;
class ArticleTypesController extends AppController {

    public function initialize(): void
    {
        parent::initialize();
        $this->set('title', 'Article Types');
    }

    public function index(): void
    {
        $query = $this->ArticleTypes->findAll();

        $articleTypes = $this->Paginator->paginate($query);

        $this->set('articleTypes', $articleTypes); 
        $this->set('description', 'Article type list');
    }

    public function add(): void 
    {
        $articleType = $this->ArticleTypes->createEntity();

        if ($this->request->is('POST')) {
            $data = $this->request->getData();
            $articleType = $this->ArticleTypes->patchEntity($articleType, $data);
            
            if($this->ArticleTypes->save($articleType))
                $this->redirect(['action' => 'index']);
        }

        $this->set('articleType', $articleType);

        $this->set('description', 'Add new article type');
    }

    public function edit(int $id) 
    {
        $articleType = $this->ArticleTypes->findById($id)->read();

        if ($this->request->is('POST')) {
            $data = $this->request->getData();
            $articleType = $this->ArticleTypes->patchEntity($articleType, $data);
            
            if($this->ArticleTypes->save($articleType))
                $this->redirect(['action' => 'index']);
        }
 
        $this->set('articleType', $articleType);

        $this->set('description', 'Edit article type');
    }

    public function delete(int $id): void
    {
        
    }

}