<?php

namespace Eagle\ORM;

use Eagle\Utility\Inflector;
use Eagle\ORM\Query;
use Eagle\ORM\Database;


class Schema {

    private $table;
    private $filename;
    private $data = [];

    public function __construct(string $table)
    {
        $this->table = $table;
        $this->filename = sprintf('%s/%s.eagle', TMP_DIR, $table);
 
        $this->data = $this->load();
    }

    private function load()
    {
        if (!file_exists($this->filename)) {
            if(!$this->generate());
                return [];
        }   

        return require $this->filename;
    }

    public function generate(): bool
    {

        $query = new Query();

        if(Database::tableExists($this->table) === false)
            return false;

        
        $result = Database::describe($this->table);

        $schema = [];
        foreach ($result as $column) {
            $schema[$column['Field']] = [
                'type' => self::extractType($column['Type']),
                'null' => $column['Null'] === 'YES',
                'key' => $column['Key'],
                'default' => $column['Default'],
            ];
        }

        $data['table'] = $this->table;
        $data['schema'] = $schema;
        $data['time'] = time();
        $data['primaryKey'] = 'id';
        

        $columns = array_keys($data['schema']);

        $targets = ['name', 'title', 'username', 'content', 'value', 'description'];
        $columns = array_keys($data['schema']);

        if ($match = array_values(array_intersect($targets, $columns))) {
            $data['displayKey'] = $match[0];
        }
        
        $data['displayKey'] = $match[0] ?? 'id';

        $content = "<?php\nreturn " . var_export($data, true) . ";";
        file_put_contents($this->filename, $content);
        return true;
    }

    protected static function extractType(string $sqlType): string {
        if (str_starts_with($sqlType, 'int')) return 'int';
        if (str_starts_with($sqlType, 'varchar')) return 'string';
        if (str_starts_with($sqlType, 'datetime')) return 'datetime';
        if (str_starts_with($sqlType, 'date')) return 'date';
        if (str_starts_with($sqlType, 'text')) return 'text';
        if (str_starts_with($sqlType, 'tinyint(1)')) return 'bool';
        // etc.
        return 'string';
    }

    public function fieldExists(string $field): bool
    {

        return isset($this->data['schema'][$field]);
    }

    public function is(string $field, string $type): bool
    {
        if (!$this->fieldExists($field))
            return false;

        return $this->data['schema'][$field]['type'] == $type;
    }

    public function getField(string $field): ?array
    {
        if ($this->fieldExists($field))
        {
            return $this->data['schema'][$field];
        }

        return null;
    }

    public function getFieldType($name): string
    {
        if(!$this->fieldExists($name))
            return '';

        return $this->data['schema'][$name]['type'];
    }

    public function getColumns(): array
    {
        if(!isset($this->data['schema']))
        return [];

        return array_keys($this->data['schema']);
    }

    public function getPrimaryKey(): string
    {
        return $this->data['primaryKey'] ?? 'id';
    }

    public function getDisplayKey() {
        return $this->data['displayKey'] ?? 'id';
    }
}