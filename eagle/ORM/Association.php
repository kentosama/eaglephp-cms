<?php

namespace Eagle\ORM;
use Eagle\ORM\Database;
use Eagle\ORM\Schema;
use Eagle\Utility\Inflector;
use Eagle\ORM\TableRegistry;

class Association {

    public $table;
    public $alias;
    public $foreignKey;
    public $associationForeignKey;
    public $type;
    public $joinTable;
    public $joinType;
    public $conditions;
    public $columns;
    public $className;
    public $limit;
    public $primaryKey;

    public function __construct(string $name, string $type, array $options = []) 
    {
        $name = Inflector::classify(Inflector::pluralize($name));
        
        $this->alias = $options['alias'] ?? $name;
        $this->className = $options['className'] ?? $this->alias;
        
        $this->table = $options['table'] ?? Inflector::tableize($this->className);
        
        $this->foreignKey = $options['foreignKey'] ?? Inflector::singularize($this->table) . '_id';
        $this->primaryKey = $options['primaryKey'] ?? 'id';
        $this->type = in_array($type, ['belongsTo', 'hasOne', 'hasMany', 'belongsToMany']) ? $type : 'belongsTo';

        
        
        $this->joinTable = $options['joinTable'] ?? null;

        if($this->type == 'belongsToMany') {
            $this->associationForeignKey = $options['associationForeignKey'] ?? Inflector::singularize($this->table) . '_id';
        }
        
        
        
        $this->joinType = $options['joinType'] ?? 'LEFT';
        $this->conditions = $options['conditions'] ?? [];

        $this->columns = $options['columns'] ?? '*';
        
        
        $this->limit = $options['limit'] ?? null;
    }

    public function getTable(): mixed
    {
        return TableRegistry::get($this->table);
    }

    


}