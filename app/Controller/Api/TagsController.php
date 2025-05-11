<?php

namespace App\Controller\Api;

use App\Controller\AppController;

class TagsController extends AppController 
{

    public function search(): void
    {
        if($this->request->is('GET')) {
            $name = $this->request->getQuery('name');
            $limit = $this->request->getQuery('limit');
            
            
            $exclude = $this->request->getQuery('exclude');
            
       

            $query = $this->Tags->findAll()
            ->select(['Tags.id', 'Tags.name'])
            ->condition([
                "Tags.name LIKE '%$name%'",
            ]);

            if(!empty($exclude))
                $query->condition(["Tags.id NOT IN (" . implode(',', $exclude) . ")"]);

            $query->limit($limit)
            ->order('name', 'ASC');
            
            $tags = $query->read();
            echo json_encode($this->Tags->entitiesToArray($tags));    
        

        }
    }
}