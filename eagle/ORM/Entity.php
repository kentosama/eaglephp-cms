<?php 

namespace Eagle\ORM;

use Eagle\Utility\Inflector;

class Entity {

    protected array $_visible = [];
    protected array $_virtual = [];

    protected bool $_isNew = true;
    protected array $_dirty = [];

    protected array $_hidden = [];
    protected array $_accessible = [
        '*' => true,
        'id' => false,
    ];

    protected $data;

    public function __construct(array $data)
    {
        $this->data = $data; 
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
        } else if(in_array($name, $this->_virtual)) {
 
            $method = $this->getMethod($name, 'get');
            if(method_exists($this, $method))
                return $this->$method();    
        }

        return null;
    }

    public function set(string $name, mixed $value, bool $dirty = true): void
    {
        if (!in_array($name, $this->_accessible) && !($this->_accessible['*'] ?? false)) {
            return;
        }

        $this->_dirty[$name] = $dirty; 
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

    public function isDirty(?string $field): bool
    {
        if($field) {
            return $this->_dirty[$field] ?? false;
        }

        foreach ($this->_dirty as $isDirty) {
            if ($isDirty) {
                return true;
            }
        }

        return false;
    }

    public function setDirty(string $field, bool $dirty): void
    {
        $this->_dirty[$field] = $dirty;
    }

    public function toArray(): array
    {
        $virtualFields = [];

        foreach($this->_virtual as $field)
        {
            $method = $this->getMethod($field, 'get');
  
            if(method_exists($this, $method))
                $virtualFields[$field] = $this->$method();
        }

        return array_merge(
            $this->data,
            $virtualFields
        );
    }
}