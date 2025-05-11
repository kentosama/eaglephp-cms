<?php 

namespace App\Model\Entity;
use Eagle\ORM\Entity;

class ArticleEntity extends Entity {

    protected array $_visible = [
        'title' => true,
        'image' => true,
    ];

}