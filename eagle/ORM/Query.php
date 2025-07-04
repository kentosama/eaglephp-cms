<?php 

namespace Eagle\ORM;

use Eagle\ErrorException;
use Eagle\ORM\Database;
use Eagle\Utility\Inflector;

use Eagle\ORM\Schema;

class Query {


    protected $readMode;
    protected $database;
    protected $contain = [];
    protected $where = [];
    protected $order = [];
    protected $limit = null;
    protected $offset = null;
    protected $columns = [];
    protected $data = [];
    protected $type;
    protected $bindings = [];

    protected $results = [];

    protected $subQueries = [];

    protected $table;
    protected $tableName;
    protected $tableAlias;
    protected $primaryKey;
    protected $associations = [];

    protected $conditions = [];
    protected $params = [];
    protected $matching = [];

    protected $joins = [];
    protected $relations;
    protected $sqlParts = [
        'SELECT' => '',
        'FROM' => '',
        'JOIN' => '',
        'WHERE' => '',
        'ORDER BY' => '',
        'LIMIT' => ''
    ];

    protected $mapCallback;

    public function __construct()
    {
        $this->database = Database::getInstance();
        $this->readMode = 'all';
    }

    protected function getMethod($name, $type = 'find'): string
    {
        $parts = explode('_', $name);
        $method = $type;
        
        foreach ($parts as $part) {
            $method .= ucfirst($part);
        }

        return $method;
    }


    public function __call($name, $arguments)
    {
        if(str_starts_with($name, 'find')) {
            return $this->table->callFinder($name, $this, $arguments);
        }
    }


    public function readMode(string $type): self {

        if(!(in_array($type, ['all', 'first', 'list'])))
            throw new ErrorException("Query read mode not avaiable: {$type}");

        $this->readMode = $type;
        return $this;
    }

    public function mapWith(callable $callback) {
        $this->mapCallback = $callback;
    }

    private function aliasColumns($alias, $columns) {
        $aliasColumns = [];
        foreach ($columns as $column) {
            $aliasColumns[] = "{$alias}.{$column} AS {$alias}__{$column}";
        }
        return $aliasColumns;
    }

    public function table(string $tableName): self {
        $this->tableName = $tableName;
        $this->table = TableRegistry::get($this->tableName);
        return $this;
    }

    public function getAlias(): string
    {
        return $this->tableAlias;
    }

    public function alias(string $tableAlias): self {
        $this->tableAlias = $tableAlias;
        return $this;
    }

    public function primaryKey(string $primaryKey): self {
        $this->primaryKey = $primaryKey;
        return $this;
    }

    public function associations(array $associations): self {
        $this->associations = array_merge($this->associations, $associations);
        return $this;
    }

    public function select(array $columns): self {
        
        $this->columns = array_unique(array_merge($columns, $this->columns));
        return $this;
    }

    public function matching(string|array $models, ?callable $callback = null): self 
    {

        if(is_string($models))
        {
            $this->matching[$models] = $callback;
            return $this;
        }

        foreach($models as $key => $value) {

            if(is_callable($value))
                $this->matching[$key] = $value;
            else $this->matching[$value] = null; 
        }

        return $this;
    }

    public function join(string $table, string $alias, string $on, string $type = 'INNER'): self
    {
        $as = '';
        if (!empty($alias)) {
            $as = " AS {$alias}";
        }

        $joinClause = strtoupper($type) . " JOIN {$table}{$as} ON {$on}";
        $this->joins[] = $joinClause;
        return $this;
    }


    public function contain($models): self {
        if (is_string($models)) {
            $this->contain[] = $models;
        } elseif (is_array($models)) {
            
            $this->contain = array_merge($models, $this->contain);
            
        }

        $this->contain = array_unique($this->contain);
        return $this;
    }

    public function where(string $field, string|int $value): self
    {
        if (is_string($value))
            $value = "\"{$value}\"";
       
        $this->conditions[] = "{$field} = {$value}";

        return $this;
    }


    public function whereLike(string $field, string $value): self
    {
        $this->conditions[] = "{$field} LIKE '%{$value}%'";
        return $this;
    }

    public function whereIn(string $field, array $values): self
    {
        if (empty($values)) {
            $this->conditions[] = '1 = 0'; // évite erreur SQL
            return $this;
        }

        $placeholders = array_fill(0, count($values), '?');
        $this->conditions[] = "{$field} IN (" . implode(',', $placeholders) . ")";
        $this->bindings = array_merge($this->bindings, $values);

        return $this;
    }



    public function or(string $field, string|int $value): self
    {
        $this->conditions['OR'][] = "{$field} = {$value}";
        return $this;
    }

    public function orLike(string $field, string $value): self
    {
        $this->conditions['OR'][] = "{$field} LIKE '%{$value}%'";
        return $this;
    }

    public function and(string $field, string|int $value): self
    {
        $this->conditions['AND'][] = "{$field} = {$value}";
        return $this;
    }

    public function andLike(string $field, string $value): self
    {
        $this->conditions['AND'][] = "{$field} LIKE '%{$value}%'";
        return $this;
    }

    public function condition($conditions): self {
        if (is_string($conditions)) {
            $this->conditions[] = $conditions;
        } elseif (is_array($conditions)) {
            foreach ($conditions as $condition) {
                $this->conditions[] = $condition;
            }
        }

        return $this;
    }

    public function getConditions(): array
    {
        return $this->conditions;   
    }

    public function order(string $field, string $direction = 'ASC'): self 
    {
        $direction = strtoupper($direction);
        if (!in_array($direction, ['ASC', 'DESC'])) {
            throw new ErrorException("Invalid sort direction: $direction");
        }

        // Si format: BaseModel.relation.field
        if (substr_count($field, '.') === 2) {
            [$baseModel, $relation, $column] = explode('.', $field);

            // On derive l'alias d'association (ex: 'Publisher' ou 'Publisher' pour 'publisher')
            $relationAlias = Inflector::classify(Inflector::pluralize($relation));

            $association = $this->associations[$relationAlias] ?? null;

            if ($association && $association->is('belongsTo')) {
                // Ajoute la jointure si elle n’existe pas déjà
                if (!isset($this->joins[$association->alias])) {
                    $this->join(
                        $association->table,
                        $association->alias,
                        "{$association->alias}.{$association->primaryKey} = {$this->tableAlias}.{$association->foreignKey}"
                    );
                }

                $this->order[] = "{$association->alias}.{$column} {$direction}";
            } else {
                throw new ErrorException("Cannot sort by association '{$relationAlias}' – not defined or unsupported type.");
            }
        } else {
            $this->order[] = "{$field} {$direction}";
        }

        return $this;
    }


    public function limit(int $limit): self {
        $this->limit = $limit;
        return $this;
    }

    public function offset(int $offset): self {
        $this->offset = $offset;
        return $this;
    }

    public function count(): int
    {
        $sql = "SELECT COUNT(*) FROM `{$this->tableName}`";
        
        $params = [];
        if (!empty($this->conditions)) {
            $where = $this->buildWhereClause($this->conditions, $params);
            $sql .= " WHERE $where";
        }
    
        $stmt = $this->database->prepare($sql);
        $stmt->execute($params);
    
        return (int)$stmt->fetchColumn();
    }

    public function insert(array $columns = []): self {

        $this->type = 'insert';
        $this->columns = $columns;

        return $this;
    }

    public function update(array $columns = []): self {

        $this->type = 'update';
        $this->columns = $columns;

        return $this;
    }

    public function into(string $table): self
    {
        $this->table = $table;
        return $this;
    }

    public function values(array $data): self
    {
        $this->data = $data;
        return $this;
    }

    public function execute(): mixed
    {
        if($this->type == 'insert') {
            return $this->executeInsert();
        } else if($this->type == 'update') {
            return $this->executeUpdate();
        }

        return false;
    }

    public function executeUpdate(): bool
    {
        $primaryValue = $this->data[$this->primaryKey];
        unset($this->data[$this->primaryKey]);
        $columns = array_keys($this->data);
        $assignments = implode(', ', array_map(fn($col) => "$col = ?", $columns));

        $sql = "UPDATE {$this->table} SET {$assignments} WHERE {$this->primaryKey} = ?";

        $stmt = $this->database->prepare($sql);
        $values = array_values($this->data);
        $values[] = $primaryValue;

        return $stmt->execute($values);
    }

    public function executeInsert(): bool
    {
        $columns = array_keys($this->data);
        $placeholders = implode(', ', array_fill(0, count($columns), '?'));
        $columnsList = implode(', ', $columns);

        $sql = "INSERT INTO {$this->table} ({$columnsList}) VALUES ({$placeholders})";

     

        $stmt = $this->database->prepare($sql);
        $values = array_values($this->data);

        return $stmt->execute($values);
    }

    public function read(): mixed
    {
        if($this->readMode == 'all')
            return $this->readAll();
        else if($this->readMode == 'list')
            return $this->readList();

        return $this->readOne();

    }

    public function readList(): array
    {
        return $this->readAll();
    }

    public function delete(int $id): bool 
    {
        $this->sqlParts = []; // Réinitialisation au cas où
        $this->bindings = []; // Réinitialise les bindings si tu les utilises

        $this->sqlParts[] = "DELETE";
        $this->sqlParts['FROM'] = "FROM {$this->tableName} AS {$this->tableAlias}";

        // Ajoute une condition de suppression par ID
        $this->conditions[] = "{$this->tableAlias}.{$this->primaryKey} = ?";
        $this->bindings[] = $id;

        // Génère les conditions WHERE
        $this->fetchConditions();

        $sql = implode(' ', $this->sqlParts);
        $sql = preg_replace('/\s+/', ' ', $sql);
        $sql = trim($sql);

        $stmt = $this->database->prepare($sql);
        return $stmt->execute($this->bindings);
    }


    public function readOne() {
        
        if(empty($this->columns)) {
            $schema = new Schema($this->tableName);
            $this->columns = $this->aliasColumns($this->tableAlias, $schema->getColumns());
        } 
        
        $this->fetchMatching();
        
        $colums = implode(', ', $this->columns);
        $this->sqlParts['SELECT'] = "SELECT {$colums}"; ;
        $this->sqlParts['FROM'] = "FROM {$this->tableName} AS {$this->tableAlias}";
        $this->sqlParts['JOIN']  = implode(' ', $this->joins);
        
        if (!empty($this->order)) {
            $this->sqlParts['ORDER BY'] = 'ORDER BY ' . implode(', ', $this->order);
        }
        $this->sqlParts['LIMIT'] = 'LIMIT 1';

        // Fetch conditions
        $this->fetchConditions();
       

        $sql = implode(' ', $this->sqlParts);
        $sql = preg_replace('/\s+/', ' ', $sql);
        $sql = trim($sql);
   
        $stmt = $this->database->prepare($sql);
        $stmt->execute($this->bindings);
        $result = $stmt->fetch(\PDO::FETCH_ASSOC);

        if(!$result)
            return null;

       

        $prefix = $this->tableAlias . '__';
        $this->results[0] = $this->nested($prefix, $result);

        $this->fetchContain();

        if (is_callable($this->mapCallback)) {
            $this->results[0] = ($this->mapCallback)($this->results[0]);
        }

        return $this->results[0];  
    }

    public function subQuery(): self 
    {
        return $this;
    }

    private function indexedBy(string $key, array $array): array
    {
        $indexed = [];

        foreach ($array as $entity) {
            $indexed[$entity->get($key)] = $entity;
        }

        return $indexed;
    }

    private function fetchContain(): void
    {
        $associationIds = [];

        foreach ($this->contain as $key => $name) {

            $callback = null;
            $associationName = null;

            if(is_string($name)) {
                $associationName = $name;
            } else if(is_callable($name)) {
                $callback = $name;
                $associationName = $key;
            }

            $association = $this->table->getAssociation($associationName);

            if (!$association) {
                throw new \ErrorException("{$this->tableAlias} is not associated with {$associationName}");
            }


            
            
            // belongsTo
            if ($association->associationType === 'belongsTo') {

                $ids = array_unique(array_map(fn($e) => $e[$association->foreignKey] ?? null, $this->results));
                $associationIds[$associationName] = array_filter($ids);

                $table = TableRegistry::get($association->table);
                $query = $table->find('all')->whereIn("{$association->className}.{$association->primaryKey}", $associationIds[$associationName]);

                if ($callback) {
                    $callback($query);
                }

                $keyName = Inflector::singularize(Inflector::tableize($association->alias));
                $results = $query->read();

                $indexed = $this->indexedBy($association->primaryKey, $results);

                

                foreach($this->results as $key => $row) {
                    $id = $row[$association->foreignKey] ?? null;
                    $this->results[$key][$keyName] = $indexed[$id] ?? null;
                    
                }
            } else if($association->associationType == 'belongsToMany') {

                $ids = array_unique(array_map(fn($e) => $e[$this->primaryKey] ?? null, $this->results));
                $ids = array_filter($ids); 

                
                $pivotTable = TableRegistry::get($association->pivotTable);
                $pivotRows = $pivotTable->find('all')
                ->whereIn($association->foreignKey, $ids)
                ->read();

                $grouped = [];
                $targetIds = [];
                foreach ($pivotRows as $row) {
                    $sourceId = $row->get($association->foreignKey);
                    $targetId = $row->get($association->targetForeignKey);

                    $grouped[$sourceId][] = $targetId;
                    $targetIds[] = $targetId;
                }

                $targetIds = array_unique($targetIds);
                $table = TableRegistry::get($association->table);
                $query = $table->find('all')->whereIn(
                    "{$association->className}.{$association->primaryKey}", 
                    $targetIds
                );

                if ($callback) {
                    $callback($query);
                }

                $relatedRows = $query->read();
                $indexedRelated = $this->indexedBy($association->primaryKey, $relatedRows);

                $keyName = Inflector::tableize($association->alias);
                foreach ($this->results as $key => $row) {
                    $sourceId = $row[$association->primaryKey];
                    $related = [];

                    foreach ($grouped[$sourceId] ?? [] as $relatedId) {
                        if (isset($indexedRelated[$relatedId])) {
                            $related[] = $indexedRelated[$relatedId];
                        }
                    }

                    $this->results[$key][$keyName] = $related;
                }

            }

            // hasOne
            elseif ($association->associationType === 'hasOne') {

            }
        }
    }



    public function readAll() {

        if(empty($this->columns)) {
            $schema = new Schema($this->tableName);
            $this->columns = $this->aliasColumns($this->tableAlias, $schema->getColumns());
        }

        

        
        $this->fetchMatching();

        $colums = implode(', ', $this->columns);
        $this->sqlParts['SELECT'] = "SELECT {$colums}"; ;
        $this->sqlParts['FROM'] = "FROM {$this->tableName} AS {$this->tableAlias}";
        $this->sqlParts['JOIN']  = implode(' ', $this->joins);

        if (!empty($this->order)) {



            $this->sqlParts['ORDER BY'] = 'ORDER BY ' . implode(', ', $this->order);
        }
        if (!is_null($this->limit)) {
            $this->sqlParts['LIMIT'] = "LIMIT {$this->limit}";
            if (!is_null($this->offset)) {
                $this->sqlParts['LIMIT'] .= " OFFSET {$this->offset}";
            }
        }
        

        // Fetch conditions
        $this->fetchConditions();
        

        $sql = implode(' ', $this->sqlParts);
        $sql = preg_replace('/\s+/', ' ', $sql);
        $sql = trim($sql);

        $this->params = $this->bindings;

        $stmt = $this->database->prepare($sql);
        $stmt->execute($this->params);
        $this->results = $stmt->fetchAll(\PDO::FETCH_ASSOC);

        $prefix = $this->tableAlias . '__';

        foreach($this->results as $key => $result) {
            $this->results[$key] = $this->nested($prefix, $result);
        }

        $this->fetchContain();

        
        
        if (is_callable($this->mapCallback)) {
            $this->results = ($this->mapCallback)($this->results);
        }

        return $this->results;

    }

    private function fetchAssociations(array $nested) {

        foreach($this->contain as $key => $relation)
        {
            $callback = null;
            if (is_string($relation))
            {
                $name = $relation;
            } else if(is_callable($relation)) {
                $name = $key;
                $callback = $relation;
            }

            if (isset($this->associations[$name]))
            {
                $association = $this->associations[$name];
                $query = new Query();

                $table = TableRegistry::get($association->table);

                

                
                if($association->is('belongsTo')) {
                    
                    $query = $table->find('first');
                    $query->alias($association->alias);
                    $field = $association->alias . '.id';
                    $value = $nested[$association->foreignKey];

                    if(is_null($value))
                        continue;

                    $result = $query->where($field, $value)->readOne();
                    
                    $_key = Inflector::tableize(Inflector::singularize($name));
                    $nested[$_key] = $result;
                } else if ($association->is('hasMany')) {
                    $query = $table->find();
                    $field = $association->alias.'.'.$association->foreignKey;
                    $value = $nested[$this->primaryKey];

                    if(is_null($value))
                        continue;

                    $query->where($field, $value);

                    if(!is_null($callback))
                        $callback($query);
                    
                    $results = $query->readAll();
                    
                    $_key = Inflector::tableize(Inflector::pluralize($association->alias));
                    
                    $nested[$_key] = $results;

                } 
                
                
                else if($association->is('belongsToMany')) {
                    $query = $table->find();
                    $table = $this->tableName . '_' . $association->table;
                    $alias = $this->tableAlias . $association->alias;
                    $field = Inflector::singularize($association->table) . '_id';

                    $tableField = Inflector::singularize($this->tableName) . '_id';

                    $_key = Inflector::tableize($association->alias);
                    $value = $nested[$this->primaryKey];
                    $query->join($table, $alias, "{$association->alias}.id = {$alias}.{$field}", 'INNER');
                    $query->where("{$alias}.{$tableField}", $value);
                    $result = $query->readAll();
                    $nested[$_key] = $result;


                }
            }
        }

        return $nested;

    }

    private function nested($prefix, $row): array {

        $nested = [];

        foreach($row as $key => $value) {
            if(strpos($key, $prefix) === 0) {
                $nestedKey = str_replace($prefix, '', $key);
                $nested[$nestedKey] = $value;
            } else {
                $nested[$key] = $value;
            }
        }

        return $nested;

    }

    private function fetchMatching()
    {
        foreach($this->matching as $model => $callback) {

            if(!isset($this->associations[$model]))
                continue;

           

            $association = $this->associations[$model];

            $joinQuery = new Query();


            if($association->associationType == 'belongsTo') {
                
                $alias = $association->alias;
                $foreignKey = $association->foreignKey;

                $joinQuery->table($association->table);
                $joinQuery->alias($alias);

                if(is_callable($callback)) {
                    $callback($joinQuery);

                    $conditions = $joinQuery->getConditions();
                    if(!empty($conditions)) {
                        $this->condition($conditions);
                    }
                }
            

                $this->join($association->table, $alias, "{$this->tableAlias}.{$foreignKey} = {$alias}.id", "INNER");
            } else if($association->associationType == 'belongsToMany') {

                $alias = $this->tableAlias.$association->alias;
                $foreignKey = $association->foreignKey;
                $associationForeignKey = $association->targetForeignKey;
                $joinTable = $association->pivotTable;

                $joinQuery->table($association->table);
                $joinQuery->alias($alias);

                if(is_callable($callback)) {
                    $callback($joinQuery);

                    $conditions = $joinQuery->getConditions();
                    if(!empty($conditions)) {
                        $this->condition($conditions);
                    }
                }

                $this->join($joinTable, $alias, "{$this->tableAlias}.id = {$alias}.{$foreignKey}", "INNER");
                $this->join($association->table, $association->alias, "{$association->alias}.id = {$alias}.{$associationForeignKey}", "INNER");



            }
                
        }
    }

    private function fetchConditions() {
        // Initialisation du tableau de conditions
        $conditions = [];
    
        // Ajouter les conditions 'AND' si elles existent
        if (isset($this->conditions['AND']) && !empty($this->conditions['AND'])) {
            $conditions[] = '(' . implode(' AND ', $this->conditions['AND']) . ')';
            unset($this->conditions['AND']);
        }
    
        // Ajouter les conditions 'OR' si elles existent
        if (isset($this->conditions['OR']) && !empty($this->conditions['OR'])) {
            $conditions[] = '(' . implode(' OR ', $this->conditions['OR']) . ')';
            unset($this->conditions['OR']);
        }
    
        // Ajouter toutes les autres conditions génériques
        if (!empty($this->conditions)) {
            $conditions[] = implode(' AND ', $this->conditions); // Connexion avec 'AND'
        }
    
        // Assembler le tout et affecter à 'WHERE'
        if (!empty($conditions)) {
            $this->sqlParts['WHERE'] = 'WHERE '. implode(' AND ', $conditions); // Assurer la cohérence avec 'AND'
        } else {
            // Si aucune condition n'est définie, on laisse 'WHERE' vide
            $this->sqlParts['WHERE'] = '';
        }
    }
    

    public function lastInsertId(): string|false
    {
        return $this->database->lastInsertId();
    }



}