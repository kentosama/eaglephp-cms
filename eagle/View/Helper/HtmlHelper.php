<?php

namespace Eagle\View\Helper;

use Eagle\View\Helper;

use Eagle\Router;

class HtmlHelper extends Helper 
{

    public function attributes(array $attributes): string
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

    public function charset(string $utf = 'utf-8'): string
    {
        return '<meta charset="' . htmlspecialchars($utf, ENT_QUOTES) . '">';
    }


    public function viewport(string $width = 'device-width', float $scale = 1.0): string
    {
        return $this->meta('viewport', "width={$width}, initial-scale={$scale}");
    }


    public function meta(string|array $name, ?string $content = null): string
    {
        if (is_array($name)) {
            $attrs = $name;
        } else {
            $attrs = [
                'name' => $name,
                'content' => $content
            ];
        }

        $attributes = $this->attributes($attrs);
        return "<meta{$attributes}>";
    }

    public function css(string|array $uri, array $options = []): string
    {
        $default = [
            'block' => false,
            'rel' => 'stylesheet',
            'type' => 'text/css',
        ];

        $options = array_merge($default, $options);

        if (is_array($uri)) {
            $parts = [];
            foreach ($uri as $u) {
                if (!is_array($u)) {
                    $parts[] = $this->css($u, $options);
                }
            }
            return implode("\n", $parts);
        }

        $attrs = [
            'href' => $uri,
            'rel' => $options['rel'],
            'type' => $options['type']
        ];

        if (!str_starts_with($attrs['href'], '/') && !str_starts_with($attrs['href'], 'http')) {
            $attrs['href'] = CSS_DIR . DS . $attrs['href'];
        }
        

        $attributes = $this->attributes($attrs);
        $html = "<link{$attributes} />";

        // Si tu veux gérer les blocs (ex: pour empiler les assets à afficher plus tard)
        if ($options['block']) {
            $this->view->append('css', $html);
            return '';
        }

        return $html;
    }


    public function script(string|array $uri, array $options = []): string
    {
        $default = [
            'block' => false,
            'type' => 'text/javascript',
        ];
    
        $options = array_merge($default, $options);
    
        if (is_array($uri)) {
            $parts = [];
            foreach ($uri as $u) {
                if (!is_array($u)) {
                    $parts[] = $this->script($u, $options);
                }
            }
            return implode("\n", $parts);
        }
    
        $attrs = [
            'src' => $uri,
            'type' => $options['type']
        ];
    
        if (!str_starts_with($attrs['src'], '/') && !str_starts_with($attrs['src'], 'http')) {
            $attrs['src'] = SCRIPT_DIR . DS . $attrs['src'];
        }
    
        $attributes = $this->attributes($attrs);
        $html = "<script{$attributes}></script>";
    
        if ($options['block']) {
            $this->view->append('script', $html);
            return '';
        }
    
        return $html;
    }

    public function image($src, array $options = []): string
    {

        if(empty($src))
        return '';

        if (!str_starts_with($src, '/') && !str_starts_with($src, 'http') && !str_starts_with($src, 'https')) {
            $src = IMG_DIR . DS . $src;
        }

        $options['src'] = $src;

        if (isset($options['srcset']) && is_array($options['srcset'])) {
            $srcset = [];
            $sizes = ['large' => 800, 'medium' => 400, 'small' => 200];
            foreach ($options['srcset'] as $size => $file) {
               
                if (file_exists(WEBROOT . $file)) {
                    $srcset[] = "{$file} {$sizes[$size]}w";
                }
            }

            unset($options['srcset']);

            
    
            if (!empty($srcset)) {
                $options['srcset'] = implode(', ', $srcset);
            }
        }
       

   
        $attrs = $this->attributes($options);

        return "<img{$attrs}>";
    }

    public function link($title, string|array $url, ?array $options = []): string
    {

        if(is_array($url)) {
            if(!isset($url['controller']))
                $url['controller'] = $this->params['controller'];

            if(!isset($url['action']))
                $url['action'] = $this->params['action'];

            if(!isset($url['prefix']))
                $url['prefix'] = $this->params['prefix'];

            $options['href'] = Router::buildUrl($url);
        } else {
            $options['href'] = $url;
        }

        $attrs = $this->attributes($options); 

        return "<a{$attrs}>{$title}</a>";
    }

    public function title(string $title, int $level = 1, array $options = []): string
    {
        $default = [
            'class' => 'title',
        ];

        $options = array_merge($default, $options);

        $attributes = $this->attributes($options);

        return "<h{$level}{$attributes}>{$title}</h{$level}>";
    }

    public function list(): string
    {

    }

    public function action(string $action, array $url = []): string 
    {

        $actions = ['add' => 'plus', 'edit' => 'pen', 'delete' => 'trash', 'view' => 'eye', 'save' => 'floppy-disk'];

        if(!isset($actions[$action]))
            return '';

        $icon = '<span class="icon"><i class="fa-solid fa-{{action}}"></i></span>';

        $icon = str_replace('{{action}}', $actions[$action], $icon);

        return $this->link($icon, $url);
    }
}