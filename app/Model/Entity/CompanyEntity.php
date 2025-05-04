<?php 

namespace App\Model\Entity;
use Eagle\ORM\Entity;

class CompanyEntity extends Entity {
    
    protected $_visible = [
        'id' => true,
        'name' => true,
        'slug' => true,
        
    ];
}