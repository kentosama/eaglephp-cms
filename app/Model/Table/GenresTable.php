<?php

namespace App\Model\Table;
use Eagle\ORM\Table;
use Eagle\ORM\Query;

class GenresTable extends Table
{

    protected function initialize()
    {
        parent::initialize();

        $this->behavior('Sluggable');
    }

}