<?php 

namespace Eagle\ORM;

use Eagle\ErrorException as EagleErrorException;
use Eagle\ORM\Database;
use Eagle\Utility\Inflector;
use Eagle\ORM\Query;
use Eagle\ORM\Schema;

use Eagle\ORM\Entity;
use ErrorException;

class Table {

    protected $tableName = null;
    protected $tableAlias = null;
    protected $primaryKey = 'id';
    protected $displayKey = 'name';
    protected $columns = [];
    protected $database = null;
    protected $associations = [];
    private $behaviors = [];
    protected $schema = null;
    protected $related = [];
    protected $entityClass;

    public function __construct()
    {
        $this->initialize();
    }

    protected function initialize()
    {   
        $tableClass = get_class($this);

        if ($tableClass == 'Eagle\ORM\Table') {
            return;
        }

        $baseName = basename(str_replace('\\', '/', $tableClass));
        $modelName = str_replace('Table', '', $baseName);
        
        $this->database = Database::getInstance();
        $this->setTable(Inflector::tableize($modelName));
        $this->setAlias(Inflector::classify($this->tableName));

        TableRegistry::add($this->tableName, $this);
    }

    public function getSchema(): Schema
    {
        return $this->schema;
    }

    public function callFinder(string $name, Query $query, array $args = []): Query
    {
        if (!method_exists($this, $name)) {
            throw new ErrorException("Finder '$name' not defined in " . static::class);
        }

        return $this->$name($query, ...$args);
    }

    public function __get($name): mixed
    {
        if(isset($this->associations[$name])) {
            $association = $this->associations[$name];
            return $association->getTable();
        }

        return null;    
    }

    public function behavior(string $name, array $config = []): void 
    {
        $basename = Inflector::classify($name).'Behavior';

        $namespace = '\\App\\Model\\Behavior\\';
        $className = $namespace . $basename;

        if(class_exists($className)) {
            $this->behaviors[$name] = new $className($config);
            return;
        }

        $namespace = __NAMESPACE__ . '\\Behavior\\';
        $className = $namespace . $basename;

        if(class_exists($className)) {
            $this->behaviors[$name] = new $className($config);
            return;
        }

        throw new ErrorException("Behavior {$name} does not exists.");
    }

    public function setTable(string $tableName): self {

        
        if(!Database::tableExists($tableName)) {
            throw new \Exception("Table {$tableName} does not exist.");
        }

        $this->tableName = $tableName;
        if(is_null($this->tableAlias))
            $this->setAlias(Inflector::classify($tableName));
        $this->schema = new Schema($this->tableName);
        $this->columns = $this->schema->getColumns();
        $this->entityClass = $this->getEntityClass($this->tableName);
        
        $this->primaryKey = $this->schema->getPrimaryKey();
        $this->displayKey = $this->schema->getDisplayKey();

        return $this;
    }

    public function setAlias(string $tableAlias): self {
        $this->tableAlias = $tableAlias;
        return $this;
    }

    public function setPrimaryKey(string $key) {

        if($this->schema->fieldExists($key))
            $this->primaryKey = $key;
        else throw new EagleErrorException("Column {$$key} does not exists in table: {$this->tableName}.");

    }

    public function setDisplayKey(string $key) {

        if($this->schema->fieldExists($key))
            $this->displayKey = $key;
        else throw new EagleErrorException("Column {$$key} does not exists in table: {$this->tableName}.");

    }

    // Associations

    protected function belongsTo(string $name, array $options = []) {
        $association = new Association($name, 'belongsTo', $options);
        $this->associations[$name] = $association;
        return $this;
    }

    protected function belongsToMany(string $name, array $options = []) {

        $default = [
            'joinTable' => Inflector::tableize($this->tableName) . '_' . Inflector::tableize($name),
            'foreignKey' => Inflector::underscore(Inflector::singularize($this->tableName)) . '_id',
        ];

        $options = array_merge($default, $options);
  
        $association = new Association($name, 'belongsToMany', $options);
        $this->associations[$name] = $association;
        return $this;
    }

    protected function hasOne(string $name, array $options) {
        $association = new Association($name, 'hasOne', $options);
        $this->associations[$name] = $association;
        return $this;
    }

    protected function hasMany(string $name, array $options) {

        $default = [
            'foreignKey' => Inflector::underscore(Inflector::singularize($this->tableName)) . '_id',
        ];

        $options = array_merge($default, $options);

        $association = new Association($name, 'hasMany', $options);
        $this->associations[$name] = $association;
        return $this;
    }

    public function isAssociated($name): bool
    {
        $model = Inflector::classify(Inflector::pluralize($name));

        return isset($this->associations[$model]);
            
    }

    public function find(string $type = 'all'): Query {
        $query = new Query();
        $query->table($this->tableName)
        ->associations($this->associations)
              ->alias($this->tableAlias)
              ->primaryKey($this->primaryKey);

        if($type == 'first') {
            $query->mapWith([$this, 'hydrate']);
            $query->limit(1);
        } else if($type == 'list') {
            $query->limit(100);
        } else {
            $query->mapWith([$this, 'marshall']);
        }

        $query->readMode($type);

        return $query;
        
    }

    public function findAll(array $options = []) {

        $query = $this->find();

        if (isset($options['select']))
            $query->select($options['select']);

        if (isset($options['conditions']))
            $query->condition($options['conditions']);

        if (isset($options['limit']))
            $query->limit($options['limit']);

        return $query;
    }

    public function findById($id): Query {
        
        $query = $this->find('first');

        return $query->where("{$this->tableAlias}.{$this->primaryKey}", $id);
    }

    public function findList(array $options = []): array {
        
        
        $default = [
            'keyField' => $this->primaryKey,
            'valueField' => $this->displayKey,
        ];

        $options = array_merge($default, $options);

        $keyField = Inflector::fieldWithAlias($this->tableAlias, $options['keyField']);
        $valueField = Inflector::fieldWithAlias($this->tableAlias, $options['valueField']);

        $query = $this->find('list');
        $query->select([$keyField, $valueField]);

        if(isset($options['conditions']))
            $query->condition($options['conditions']);

        if(isset($options['limit']))
            $query->limit($options['limit']);
   
        $query->mapWith(function ($results) use($options) {
         
            $list = [];
            $keyField = $options['keyField'];
            $valueField = $options['valueField'];
            foreach ($results as $row) {
                $list[$row[$keyField]] = $row[$valueField];
            }

            return $list;
        });

        $results = $query->read();
        
        return $results;
    }

    private function getEntityClass(string $table): ?string 
    {
        $baseName = Inflector::singularize(Inflector::classify($table)) . 'Entity';
        $className = "\\App\\Model\\Entity\\{$baseName}";

        if(!class_exists($className)) {
            $className = "\\Eagle\ORM\Entity";
        }

        return $className;
    }

    public function createEntity(?array $data = []): mixed
    {
        
        $entity = $this->hydrate($data);

        

        return $entity;
    }

    public function patchEntity(Entity $entity, array $data): Entity
    {
        foreach ($data as $key => $value) {
            $entity->set($key, $value);
        }

        return $entity;
    }

    public function isManyAssociation($name) {
         if (!isset($this->associations[$name])) {
            return false;  // Ou lancer une exception si nécessaire
        }
        $asso = $this->associations[$name];
        return (in_array($asso->type, ['hasMany', 'belongsToMany']));
    }

    public function hydrate(array $result): mixed
    {
        foreach($result as $key => $value) {

            if ($value instanceof Entity)
            continue;

            if(is_array($value) && !empty($value)) {
                if($value[0] instanceof Entity)
                    continue;
            }

            if (!$this->schema->fieldExists($key)) {
                unset($result[$key]);
                continue;
            }

            // Time
            if ($this->schema->is($key, 'datetime') || $this->schema->is($key, 'date') ) {
                if (is_string($value)) {
                    try {
                        $date = new \DateTime($value);
                        $result[$key] = $date;
                    } catch (\Exception $e) {
                        $result[$key] = null;
                    }
                } else {
                    $result[$key] = null;
                }
            }

        }

        $entity = new $this->entityClass($result);

        
        if (empty($result[$this->primaryKey])) {
            $entity->setNew(true);
        } else {
            $entity->setNew(false);
        }

        return $entity;
    }


    public function marshall(array $results): array
    {
        
        $entities = [];
        foreach($results as $result) {
            $entities[] = $this->hydrate($result);
        }


        return $entities;
    }

    public function save(Entity $entity): bool
    {   
        $saved = true;

        foreach($this->behaviors as $behavior) {
            $saved = $behavior->beforeSave($entity);

            if(!$saved) return false;
        }

        
        
        $query = new Query();

        $data = $entity->toArray();

        foreach ($data as $key => $value) {
            if ($this->schema->is($key, 'datetime')) {
                if ($value instanceof \DateTimeInterface) {
                    $data[$key] = $value->format('Y-m-d H:i:s');
                } elseif (is_string($value)) {
                    $date = new \DateTime($value);
                    $data[$key] = $date->format('Y-m-d H:i:s');
                } else {
                    $data[$key] = null;
                }
            } else if ($this->schema->is($key, 'date')) {
                if ($value instanceof \DateTimeInterface) {
                    $data[$key] = $value->format('Y-m-d');
                } elseif (is_string($value)) {
                    $date = new \DateTime($value);
                    $data[$key] = $date->format('Y-m-d');
                } else {
                    $data[$key] = null;
                }
            } else if ($this->schema->is($key, 'string')) {
                if (empty($value))
                    $data[$key] = null;
            } else if ($this->schema->is($key, 'int')) {
                if (is_float($value))
                    $data[$key] = (int) $value;
                else if (is_string($value)) {
                    if (empty($value))
                        $data[$key] =  null;
                    else
                        $data[$key] = intval($value);
                }
            }
        }

        $filteredData = [];
        foreach ($this->columns as $key => $column) {
            if (isset($data[$column])) {
                $filteredData[$column] = $data[$column];
            }
        }

        $query->primaryKey($this->primaryKey);
        
        if($entity->isNew()) {
            $query->insert($this->columns)->into($this->tableName)->values($filteredData); 
        } else {
            $query->update($this->columns)->into($this->tableName)->values($filteredData);
        }

        $saved = $query->execute();

        foreach($this->behaviors as $behavior) {
            $behavior->afterSave($entity);
        }

        return $saved;

       
    }

    

}