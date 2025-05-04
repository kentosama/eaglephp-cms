<?php

namespace Eagle\ORM\Behavior;

use Eagle\ORM\Behavior;
use Eagle\ORM\Entity;
use Eagle\Utility\Text;

class SluggableBehavior extends Behavior {


    protected $_defaultConfig = [
        'keyField'      => 'name',
        'sourceField'   => 'slug',
        'pattern'       => '{slug}'
    ];
   

    public function initialize(array $config = [])
    {
        parent::initialize($config);
    }
    
    public function beforeSave(Entity $entity): bool
    {
        if ($entity->isNew() || is_null($entity->slug) || empty($entity->slug)) {


            $keyField = $this->_config['keyField'];
            $sourceField = $this->_config['sourceField'];
            $pattern = $this->_config['pattern'];

            $slug = Text::sluggify($entity->{$keyField});
            $slug = str_replace('{slug}', $slug, $pattern);
            $entity->set($sourceField, $slug);
        }

        return true;
    }

}