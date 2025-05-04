<?php

namespace App\Model\Table;
use Eagle\ORM\Table;

class UsersTable extends Table
{

    protected function initialize()
    {
        parent::initialize();

        
        $this->hasMany('Articles', [

        ]);
    }


}