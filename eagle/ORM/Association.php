<?php

namespace Eagle\ORM;

use Eagle\ErrorException;
use Eagle\ORM\Database;
use Eagle\ORM\Schema;
use Eagle\Utility\Inflector;
use Eagle\ORM\TableRegistry;

class Association {

    public $table;
    public $alias;
    public $sourceTable;
    public $sourceAlias;
    public $targetTable;
    public $targetAlias;
    public $foreignKey;
    public $targetForeignKey;
    public $associationType;
    public $pivotTable;
    public $pivotAlias;
    public $strategy;
    public $joinType;
    public $conditions;
    public $columns;
    public $className;
    public $fetchLimit;
    public $primaryKey;

    public function __construct(string $name, string $associationType, array $options = []) 
    {
        // Nom de l'association (ex: Tags) => utilisé pour className
        $this->className = $options['className'] ?? Inflector::classify(Inflector::pluralize($name));

        $this->associationType = in_array($associationType, ['belongsTo', 'hasOne', 'hasMany', 'belongsToMany'])
            ? $associationType
            : throw new \ErrorException("Association type does not exist!");

        $this->primaryKey = $options['primaryKey'] ?? 'id';

        // Alias pour l'association (ex: Tags)
        $this->alias = $options['alias'] ?? $this->className;

        // Table cible (la table du modèle lié)
        $this->table = $options['table'] ?? Inflector::tableize($this->className);

        if ($this->associationType === 'belongsToMany') {
            // Table de la source (table du modèle actuel qui appelle belongsToMany)
            $this->sourceTable = $options['sourceTable'] ?? null;
            $this->sourceAlias = $options['sourceAlias'] ?? null;

            // Table cible (déjà définie au-dessus avec $this->table)
            $this->targetTable = $this->table;
            $this->targetAlias = $this->alias;

            // Table pivot
            $this->pivotTable = $options['pivotTable']
                ?? Inflector::tableize($this->sourceTable) . '_' . Inflector::tableize($this->targetTable);

            $this->pivotAlias = $options['pivotAlias'] ?? $this->sourceAlias . $this->targetAlias;

            // Clés dans la table pivot
            $this->foreignKey = $options['foreignKey']
                ?? Inflector::singularize($this->sourceTable) . '_id';

            $this->targetForeignKey = $options['targetForeignKey']
                ?? Inflector::singularize($this->targetTable) . '_id';
        }

        elseif (in_array($this->associationType, ['hasOne', 'hasMany'])) {
            // La clé étrangère est dans la table liée
            $this->foreignKey = $options['foreignKey'] ?? Inflector::singularize($this->sourceTable ?? '') . '_id';
        }

        elseif ($this->associationType === 'belongsTo') {
            // La clé étrangère est dans la table source (locale)
            $this->foreignKey = $options['foreignKey'] ?? Inflector::singularize($this->table) . '_id';
        }

        // Options communes
        $this->joinType = $options['joinType'] ?? 'LEFT';
        $this->conditions = $options['conditions'] ?? [];
        $this->columns = $options['columns'] ?? '*';
        $this->fetchLimit = $options['fetchLimit'] ?? 0;
    }


    public function is($associationType): bool
    {
        return $this->associationType == $associationType;
    }

    public function getTable(): mixed
    {
        return TableRegistry::get($this->table);
    }

    


}