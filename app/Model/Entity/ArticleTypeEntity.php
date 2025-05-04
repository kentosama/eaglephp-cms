<?php 

namespace App\Model\Entity;
use Eagle\ORM\Entity;

use Eagle\Utility\Inflector;

class ArticleTypeEntity extends Entity {

    protected $_visible = [
        'name' => true,
        'slug' => true,
    ];
    
    protected $_virtual = [
        'plurialize' => true,
    ];

    public function getPlurialize(): string
    {
        if($this->name == 'Focus')
            return $this->name;

        return Inflector::pluralize($this->name); 
    }
}