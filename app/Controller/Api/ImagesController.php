<?php

namespace App\Controller\Api;

use App\Controller\AppController;

class ImagesController extends AppController
{
    public function get(): void
    {
        $query = $this->Images->findAll()->order('Images.created', 'DESC');

        $images = $this->Paginator->paginate($query, ['limit' => 40]);
        $images = $this->Images->entitiesToArray($images->read());

   

        $meta = $this->Paginator->meta();

        $data = [
            'paginator' => $meta,
            'items' => $images,
        ];

        echo json_encode($data);
    }

    public function update(): void
    {
        
    }

    public function upload(): void
    {
        if($this->request->is('POST')) {

            $image = $this->Images->createEntity($this->request->getData());

            if($this->Images->save($image)) {

                echo json_encode($image->toArray());
            }

        }
    }
}