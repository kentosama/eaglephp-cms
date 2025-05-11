<?php
namespace App\Controller\Admin;

use App\Controller\AppController;
use Eagle\ORM\Query;
use Eagle\Utility\Image;

class ImagesController extends AppController {

   
    public function index(): void
    {
        
        $query = $this->Images->findAll();

        if($this->request->is('GET'))
        {
            $data = $this->request->getQuery();

            if(isset($data['title']))
            {
                $query->conditions(['Images.title LIKE' => '%'.$data['title'].'%']); 
            }

            if(isset($data['publisher']))
            {
                $query->conditions(['Publishers.name LIKE' => '%'.$data['publisher'].'%']); 
            }

            if(isset($data['developer']))
            {
                $query->conditions(['Developers.name LIKE' => '%'.$data['developer'].'%']); 
            }

            if(isset($data['genre']))
            {
                $query->conditions(['Genres.id' => $data['genre']]); 
            }

            if(isset($data['system']))
            {
                $query->conditions(['Systems.id' => $data['system']]); 
            }

            if(isset($data['year']))
            {
                $query->conditions(['YEAR(Images.release_date)' => $data['year']]); 
            }

        }
       
        

        $images = $this->Paginator->paginate($query, ['limit' => 42]);
         
       
        $this->set('images', $images); 
        $this->set('description', 'All image');
    }


    public function add(): void 
    {
        $image = $this->Images->createEntity();

        if ($this->request->is('POST')) {
            $data = $this->request->getData();
            $image = $this->Images->patchEntity($image, $data);
            
            if($this->Images->save($image))
                $this->redirect(['action' => 'index']);
        }

        $this->set('image', $image);
        $this->set('description', 'Add new image');
    }

    public function edit(int $id) 
    {
        $image = $this->Images->findById($id)
        ->execute();

        if ($this->request->is('POST')) {
            $data = $this->request->getData();

            $image = $this->Images->patchEntity($image, $data);
            
            if($this->Images->save($image))
                $this->redirect(['action' => 'index']);
        }

       
        $this->set('image', $image);
        $this->set('description', 'Edit image');
    }

    public function delete(int $id): void
    {
        
    }

}