<?php

namespace App\Model\Table;
use Eagle\ORM\Table;
use Eagle\ORM\Query;

class ArticleTypesTable extends Table
{

    protected function initialize()
    {
        parent::initialize();

        $this->belongsTo('Articles');
       
    }




}