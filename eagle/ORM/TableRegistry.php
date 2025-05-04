<?php

namespace Eagle\ORM;
use Eagle\ORM\Database;
use Eagle\Utility\Inflector;

class TableRegistry 
{
    protected static $tables = [];

    public static function add(string $alias, Table $table): void
    {
        self::$tables[$alias] = $table;
    }

    public static function get(string $alias): ?Table
    {
        if (isset(self::$tables[$alias])) {
            return self::$tables[$alias];
        }

        $className = "\\App\\Model\\Table\\" . Inflector::classify($alias) . "Table";
        
       

        if (class_exists($className)) {
            self::$tables[$alias] = new $className();
            return self::$tables[$alias];
        } else {
            $table = new Table();
            $table->setTable($alias);

            self::$tables[$alias] = $table;
            return self::$tables[$alias];
        }

        return null;
    }

}