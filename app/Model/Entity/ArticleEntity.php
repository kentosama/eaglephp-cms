<?php 

namespace App\Model\Entity;
use Eagle\ORM\Entity;

class ArticleEntity extends Entity {

    protected $_visible = [
        'title' => true,
        'image' => true,
    ];

}