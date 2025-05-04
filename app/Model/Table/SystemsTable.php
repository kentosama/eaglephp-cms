<?php

namespace App\Model\Table;
use Eagle\ORM\Table;
use Eagle\ORM\Query;

class SystemsTable extends Table
{

    protected function initialize()
    {
        parent::initialize();

        $this->belongsToMany('Articles');

    }

}