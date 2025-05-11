<?php

namespace Eagle\ORM;

use Eagle\ORM\Entity;

class Behavior {

    protected $_defaultConfig = [];
    protected $_config = [];


    public function __construct(array $config = [])
    {
        $this->initialize($config);
    }

    public function initialize(array $config = [])
    {
        $this->_config = array_merge($this->_defaultConfig, $config);

    }

    public function beforeSave(Entity $entity): bool
    {
        return true;
    }

    public function afterSave(Entity $entity): bool
    {
        return true;
    }

}