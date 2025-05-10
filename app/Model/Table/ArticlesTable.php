<?php

namespace App\Model\Table;
use Eagle\ORM\Table;
use Eagle\ORM\Query;

class ArticlesTable extends Table
{

    protected function initialize()
    {
        parent::initialize();

        $this->behavior('Sluggable', ['keyField' => 'title']);

        $this->belongsTo('Images');
        $this->belongsTo('Types', [
            'className' => 'ArticleTypes',
            'foreignKey' => 'type_id',
        ]);
        $this->belongsToMany('Tags');
        $this->belongsToMany('Systems');
        $this->belongsTo('Authors', [
            'className' => 'Users',
            'foreignKey' => 'user_id'
        ]);
    }

    public function findReview(Query $query): Query
    {
        return $query->matching('Types', function($q) { 
            $q->where('Types.content_type', 'review');
        });
    }


}