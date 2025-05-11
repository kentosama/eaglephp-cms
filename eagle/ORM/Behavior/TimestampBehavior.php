<?php

namespace Eagle\ORM\Behavior;

use Eagle\ORM\Behavior;
use Eagle\ORM\Entity;
use Eagle\Utility\Time;

class TimestampBehavior extends Behavior {


    protected $_defaultConfig = [
        'add'      => 'created',
        'update'   => 'modified',
    ];
   

    public function initialize(array $config = [])
    {
        parent::initialize($config);
    }
    
    public function beforeSave(Entity $entity): bool
    {
        $datetime = Time::now();

        if ($entity->isNew()) {
            $entity->set($this->_config['add'], $datetime, false);
        }
        else
        {
            if(empty($entity->created))
                $entity->set($this->_config['add'], $datetime, false);

            $entity->set($this->_config['update'], $datetime, false);
        }

        return true;
    }

}
