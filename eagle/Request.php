<?php

namespace Eagle;
use Eagle\Router;

class Request {

    protected $data;
    protected $query;
    protected $params;
    protected $files;
    protected $uri;
    protected $location;

    protected $startTime;

    public function __construct()
    {   
        $this->startTime = $_SERVER['REQUEST_TIME_FLOAT'] ?? microtime(true);    
    }

    public function getExecutionTime(): float
    {
        return round((microtime(true) - $this->startTime) * 1000, 2);
    }


    public function getParams(?string $name = null): string|array {
        $params = [
            'prefix' => '',
            'controller' => '',
            'action' => '',
            'pass' => null,
            'query' => null
        ];


        $this->uri = $_SERVER['REQUEST_URI'] ?? '/';
        $parsed = parse_url($this->uri);
        $path = $parsed['path'] ?? '';

        $router = new Router();

        $route = $router->reverse($path);
       
        if(is_null($route)) {
            echo 'not found'; die();
        }

        $params['prefix'] = trim($route['prefix'], '/');
        $params['controller'] = $route['controller'];
        $params['action'] = $route['action'];
        $params['pass'] = $route['params'];
        $params['query'] = $_GET;


        if(!is_null($name)) {
            return $params[$name] ?? null;
        }

        return $params;
    }

    public function is(string $request): bool
    {
        return ($_SERVER['REQUEST_METHOD'] === $request);   
    }

    public function getData($name = null)
    {
        
        $data = [];
    
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $contentType = $_SERVER['CONTENT_TYPE'] ?? '';
    
            if (strpos($contentType, 'application/json') !== false) {
                $json = file_get_contents('php://input');
                $data = json_decode($json, true) ?? [];
            } else {
                $data = array_merge($_POST, $_FILES);
            }
        }

        if ($_SERVER['REQUEST_METHOD'] === 'GET' || !empty($_GET)) {
            $data = array_merge($data, $_GET);
        }

        if (!is_null($name)) {
            if (isset($data[$name])) {
                return $data[$name];
            }
            return NULL;
        }

        return $data;
    }

    public function getQuery(?string $name = null): mixed
    {
        if ($name !== null) {
            return $_GET[$name] ?? null;
        }
        return $_GET;
    }

    public function buildQueryUrl(array $modifiers = []): string
    {
        $query = $this->getQuery();

        $query = array_merge($query, $modifiers);
    
        return '?' . http_build_query($query);
    }

}