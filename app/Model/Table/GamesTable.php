<?php

namespace App\Model\Table;
use Eagle\ORM\Table;
use Eagle\ORM\Query;

class GamesTable extends Table
{

    protected function initialize()
    {
        parent::initialize();

        $this->belongsTo('Publishers', [
            'className' => 'Companies',
            'foreignKey' => 'publisher_id'
        ]);

        $this->belongsTo('Developers', [
            'className' => 'Companies',
            'foreignKey' => 'developer_id'
        ]);

        $this->belongsTo('Genres');
        $this->belongsTo('Images');
        $this->belongsTo('Systems');



    }

}