<?php 

namespace App\Model\Entity;
use Eagle\ORM\Entity;

use Eagle\Utility\Inflector;

class ArticleTypeEntity extends Entity {

    protected array $_visible = [
        'name' => true,
        'slug' => true,
    ];
    
    protected array $_virtual = [
        'plurialize'
    ];

    public function getPlurialize(): string
    {
        if($this->name == 'Focus')
            return $this->name;

        return Inflector::pluralize($this->name); 
    }
}