<?php

namespace App\Model\Table;
use Eagle\ORM\Table;

class TagsTable extends Table
{

    protected function initialize()
    {
        parent::initialize();

        
        $this->belongsToMany('Articles');
        $this->behavior('Sluggable');
    }


}