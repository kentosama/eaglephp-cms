<?php 

namespace App\Model\Entity;
use Eagle\ORM\Entity;

class UserEntity extends Entity {
    
    protected $_visible = [
        'username' => true,
        'motto' => true,
    ];

    protected $_virtual = [
        'avatar' => true
    ];

    public function getAvatar(): string
    {
        $filename = "users/{$this->username}.webp";



        if(!file_exists(WEBROOT . DS . $filename))
        return '';

        return DS.$filename;


    }
}