<?php 

namespace Eagle\ORM;

use Eagle\Utility\Inflector;

class Entity {

    protected $_visible = [];
    protected $_virtual = [];

    protected bool $_isNew = true;

    protected $_hidden = [];
    protected $_accessible = [
        '*' => true,
        'id' => false,
    ];

    protected $data;

    public function __construct(array $data)
    {
        $this->data = array_merge($data,$this->_virtual);     
    }

    public function __get($name): mixed
    { 
        return $this->get($name);
    }

    public function get($name): mixed
    {
       
        if (isset($this->data[$name]))
        {
            $value = $this->data[$name];
            
            if (!is_a($value, Entity::class))  {
                
                $method = $this->getMethod($name, 'get');
                
                if(method_exists($this, $method))
                    return $this->$method($this->data[$name]);
            }

            return $this->data[$name];
        }

        return null;
    }

    public function set(string $name, mixed $value): void
    {
        if (!in_array($name, $this->_accessible) && !($this->_accessible['*'] ?? false)) {
            return;
        }

        $this->data[$name] = $value;
    } 

    public function has($name): bool 
    {
        if (array_key_exists($name, $this->data)) {
            return true;
        }

        $method = $this->getMethod($name, 'get');
        if (method_exists($this, $method)) {
            return true;
        }

        return false;
    }

    public function isEmpty(string $name): bool
    {
        if (!$this->has($name)) {
            return true;
        }

        $value = $this->get($name);
        return empty($value);
    }

    protected function getMethod($name, $type = 'set'): string
    {
        $parts = explode('_', $name);
        $method = $type === 'get' ? 'get' : 'set';
        
        foreach ($parts as $part) {
            $method .= ucfirst($part);
        }

        return $method;
    }

    public function isNew(): bool
    {
        return $this->_isNew;
    }

    public function setNew(bool $new): void
    {
        $this->_isNew = $new;
    }

    public function toArray(): array
    {
        $virtualFields = [];

        foreach($this->_virtual as $field)
        {
            $method = $this->getMethod($field, 'get');
            if(method_exists($this, $method))
                $virtualFields[$field] = $this->$method($this->data[$field]);
        }

        return array_merge(
            $this->data,
            $virtualFields
        );
    }
}