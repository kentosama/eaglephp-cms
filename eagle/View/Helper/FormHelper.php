<?php 

namespace Eagle\View\Helper;

use DateTime;
use Eagle\View\Helper;
use Eagle\ORM\Entity;
use Eagle\ORM\TableRegistry;
use Eagle\Utility\Inflector;
class FormHelper extends Helper
{

    protected $table;
    protected $schema;
    protected $modelName;
    protected $entity;
    protected $template = [

        'inputContainerClass' => 'field',
        'inputClass' => 'input',
        'input' => '<div class="{{inputContainerClass}}">{{label}}<div class="control"><input{{attributes}}></div></div>', 
        'selectClass' => 'select is-fullwidth',
        'select' => '<div class="{{inputContainerClass}}">{{label}}<div class="control is-expanded"><div class="{{selectClass}}"><select{{attributes}}>{{options}}</select></div></div></div>',
        'textareaClass' => 'textarea',
        'textarea' => '<div class="{{inputContainerClass}}">{{label}}<div class="control"><textarea{{attributes}}>{{content}}</textarea></div></div>',
        'labelClass' => 'label',
        'label' => '<label{{attributes}}>{{content}}</label>',
        'submitClass' => 'button is-link',
        'submit' => '<div class="{{inputContainerClass}}"><div class="control"><button{{attributes}}>{{content}}</button></div></div>'

    ];

    private function attributes(array $attributes): string
    {
        $html = '';

        foreach ($attributes as $key => $value) {
            if ($value === true) {
                $html .= " " . htmlspecialchars($key);
            } elseif ($value !== false && $value !== null) {
                $html .= " " . htmlspecialchars($key) . '="' . htmlspecialchars((string)$value) . '"';
            }
        }

        return $html;
    }

    private function fieldValue(string $name): mixed
    {
        $value = null;
        $request = $this->view->request;

        if ($request->is('POST')) {
            $value = $request->getData($name);
        } elseif ($request->is('GET')) {
            $value = $request->getQuery($name);
        }
        
        if ($value === null && !is_null($this->entity)) {
            $value = $this->entity->get($name);
        }
        
        return $value ?? $args['value'] ?? null;
    }


    public function create(?Entity $entity = null, array $args = []): string
    {
        if ($entity) {
            $class = get_class($entity);
    
            if (!str_ends_with($class, 'Entity')) {
                throw new \Exception("L'entité $class ne suit pas la convention *Entity");
            }
    
            $shortName = str_replace('Entity', '', basename(str_replace('\\', '/', $class)));
            $tableName = Inflector::inflect($shortName);

            if(empty($tableName)) {

            }
       

            $this->table = TableRegistry::get($tableName);
            $this->schema = $this->table->getSchema();
            $this->modelName = $shortName;
            $this->entity = $entity;
        }

        $default = [
            'method' => 'POST',
            'enctype' => false,
            'accept-charset' => 'UTF-8',
        ];

        $args = array_merge($default, $args);

        if(isset($args['type'])) {
            if($args['type'] == 'file') {
                $args['enctype'] = 'multipart/form-data';
            }

            unset($args['type']);
        }

        if (!isset($args['id']) && isset($this->modelName)) {
            $args['id'] = strtolower($this->modelName) . '-form';
        }

        $attributes = $this->attributes($args);

        return "<form{$attributes}>";

    }

    public function end(): string
    {
        return '</form>';
    }

    public function submit(string $name, array $args = []): string 
    {
        $template = $this->template['submit'];
        $containerClass = $this->template['inputContainerClass'] ?? '';
        $defaultClass = $this->template['submitClass'];

        $args['class'] = $args['class'] ?? $defaultClass;
    
        $attributes = $this->attributes($args);
    
    
    
        return str_replace(
            ['{{inputContainerClass}}', '{{attributes}}', '{{content}}'],
            [$containerClass, $attributes, $name],
            $template
        );
    }
    

    public function control(string $name, array $args = []): string
    {
        $type = 'input';
        $label = str_replace('_', ' ', $name);

        if($this->schema) {
            $type = $this->schema->getFieldType($name);    
        }

        switch($type) {
            case "string":
                $default = ['type' => 'text', 'label' => $label];
                return $this->input($name, array_merge($default, $args));
            case "int":
                $default = ['type' => 'text', 'label' => $label];
                return $this->input($name, array_merge($default, $args));
            default:
                $default = ['type' => 'text', 'label' => $label];
                return $this->input($name, array_merge($default, $args));
        }

    }

    public function label(string $name, array $args = []): string
    {
        $template = $this->template['label'];
    
        $class = $this->template['labelClass'];
    
        $args['class'] = isset($args['class']) ? $args['class'] : $class;

        
        $label = $args['label'] ?? Inflector::labelize($name);
        unset($args['label']);
        
        $attributes = $this->attributes($args);
        
        return str_replace(['{{attributes}}', '{{content}}'], [$attributes, $label], $template);
    }
    
    public function input(string $name, array $args = []): string
    {
        $template = $this->template['input'];
        $defaultClass = $this->template['inputClass'];
        $containerClass = $this->template['inputContainerClass'];
        $value = $this->fieldValue($name);

        if($value instanceof DateTime) {
            $value = $value->format('d/m/Y h:m:s');
        }

        // Gestion du label
        $label = '';
        if (isset($args['label']) && $args['label'] !== false) {
            if (is_string($args['label'])) {
                $label = $this->label($name, ['label' => $args['label']]);
            } elseif (is_array($args['label'])) {
                $label = $this->label($name, $args['label']);
            } else {
                $label = $this->label($name);
            }
        }
        unset($args['label']);

        // Attributs de base
        $args['name'] = $name;
        $args['id'] = $args['id'] ?? $name;
        $args['type'] = $args['type'] ?? 'text';
        $args['class'] = $args['class'] ?? $defaultClass;
        $args['value'] = $args['value'] ?? $value;

        // Générer les attributs HTML
        $attributes = $this->attributes($args);

        // Injection dans le template
        return str_replace(
            ['{{inputContainerClass}}', '{{label}}', '{{attributes}}'],
            [$containerClass, $label, $attributes],
            $template
        );
    }


    public function select(string $name, $options = [], array $args = []): string
    {
        $template = $this->template['select'];
        $defaultClass = $this->template['selectClass'];
        $containerClass = $this->template['inputContainerClass'];
        $selectedValue = $this->fieldValue($name);
    
        // Gestion du label
        $label = '';
        if (isset($args['label']) && $args['label'] !== false) {
            if (is_string($args['label'])) {
                $label = $this->label($name, ['label' => $args['label']]);
            } elseif (is_array($args['label'])) {
                $label = $this->label($name, $args['label']);
            } else {
                $label = $this->label($name);
            }
        }
        unset($args['label']);
    
        // Attributs de base
        $args['name'] = $name;
        $args['id'] = $args['id'] ?? $name;
        $args['class'] = $args['class'] ?? $defaultClass;
    
        // Générer les attributs HTML
        $attributes = $this->attributes($args);
    
        // Générer les balises <option>
        $htmlOptions = '';
        foreach ($options as $key => $value) {
            $selected = ((string)$key === (string)$selectedValue) ? ' selected' : '';
            $htmlOptions .= "<option value=\"" . htmlspecialchars($key) . "\"$selected>" . htmlspecialchars($value) . "</option>";
        }
    
        // Assemblage
        
    
        return str_replace(
            ['{{inputContainerClass}}', '{{label}}', '{{selectClass}}', '{{attributes}}', '{{options}}'],
            [$containerClass, $label, $defaultClass, $attributes, $htmlOptions],
            $template
        );
    }
    
    public function checkbox(string $name, array $args = []): string
    {
        return '';
    }

    public function button(string $name, array $args = []): string
    {
        return '';
    }

    public function textarea(string $name, array $options = []): string
    {
        $template = $this->template['textarea'];
        $defaultClass = $this->template['textareaClass'];
        $containerClass = $this->template['inputContainerClass'];
        $value = $this->fieldValue($name);

        // Gestion du label
        $label = '';
        if (isset($options['label']) && $options['label'] !== false) {
            if (is_string($options['label'])) {
                $label = $this->label($name, ['label' => $options['label']]);
            } elseif (is_array($options['label'])) {
                $label = $this->label($name, $options['label']);
            } else {
                $label = $this->label($name);
            }
        }
        unset($options['label']);

        // Attributs de base
        $options['name'] = $name;
        $options['id'] = $options['id'] ?? $name;
        $options['class'] = $options['class'] ?? $defaultClass;

        // Générer les attributs HTML
        $attributes = $this->attributes($options);

        // Contenu de la textarea
        $escapedValue = htmlspecialchars((string)$value);

        $content = $escapedValue;

        return str_replace(
            ['{{inputContainerClass}}', '{{label}}', '{{attributes}}', '{{content}}'],
            [$containerClass, $label, $attributes, $content],
            $template
        );
    }


}