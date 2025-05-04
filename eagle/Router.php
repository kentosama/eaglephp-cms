<?php
namespace Eagle;


use FastRoute\RouteCollector;
use function FastRoute\simpleDispatcher;
use Eagle\ErrorException;

use Eagle\Request;

class Router {

    private static array $routes = [];

    private static array $default = [
        ['path' => ':controller/:action/:id', 'url' => [], 'pass' => ['id' => '[0-9]']],
        ['path' => ':controller/:action', 'url' => []],
        ['path' => ':controller', 'url' => [],]
    ];


    public function fallback(): array {
        return $this->default;
    }

    public static function buildUrl(array $url): string
    {
        $prefix = $url['prefix'] ?? DS;
        if(!str_starts_with($prefix, DS))
            $prefix = DS.$prefix;

        $routes = self::$routes[$prefix] ?? [];

        foreach ($routes as $route) {
            $routeUrl = $route['url'] ?? [];

            // Vérifie que controller et action correspondent
            foreach (['controller', 'action'] as $key) {
                if (isset($routeUrl[$key]) && (!isset($url[$key]) || $url[$key] !== $routeUrl[$key])) {
                    continue 2; // passe à la route suivante
                }
            }

            // Vérifie que tous les params dynamiques sont présents
            $path = $route['path'];
            preg_match_all('/:([a-zA-Z0-9_]+)/', $path, $matches);
            $requiredParams = $matches[1];

            foreach ($requiredParams as $param) {
                if (!isset($url[$param])) {
                    continue 2; // paramètre manquant
                }
            }

            // Tous les paramètres sont là, on peut construire l'URL
            foreach ($requiredParams as $param) {
                $path = str_replace(":$param", $url[$param], $path);
            }

            return rtrim($prefix, '/') . '/' . ltrim($path, '/');
        }

        return ''; // aucune route correspondante
    }



    public static function scope(string $prefix, callable $callback, bool $fallback = false)
    {
        $routes = $callback();

        if($fallback)
            $routes = array_merge($routes, self::$default);

        foreach ($routes as $route) {
            self::$routes[$prefix][] = [
                'path' => $route['path'],
                'url' => $route['url'],
                'pass' => $route['pass'] ?? [],
            ];
        }
    }


    private function getPrefix(string $path): string
    {
        $segments = explode('/', trim($path, '/'));
        $prefix = '/'. $segments[0] ?? '';

        if(isset(self::$routes[$prefix]))
            return $prefix;

        return '/';
    }

    private function matchRoute(string $path, array $routes): mixed
    {
        $segments = explode('/', trim($path, '/'));

        foreach ($routes as $route) {
            $routePath = trim($route['path'], '/');
            $routeSegments = explode('/', $routePath);

            if($routePath == '')
            {
                if($routePath == $path)
                return $route;
                else continue;
            }

            if (count($segments) == count($routeSegments)) {
                $params = [];
                $match = true;

                foreach ($routeSegments as $index => $segment) {
                    $value = $segments[$index];
                    if ($segment[0] != ':') {
                        if ($segment != $segments[$index]) {
                            $match = false;
                            break;
                        }
                    } else {
                        $paramName = substr($segment, 1);
                        $params[$paramName] = $value;

                        if (!empty($route['pass'][$paramName])) {
                            $pattern = '/^' . $route['pass'][$paramName] . '+$/';
                            if (!preg_match($pattern, $value)) {
                                $match = false;
                                break;
                            }
                        }
                    }
                }

                if ($match) {
                    foreach (['controller', 'action'] as $key) {
                        if (!isset($route['url'][$key]) && isset($params[$key])) {
                            $route['url'][$key] = $params[$key];
                            unset($params[$key]);
                        }
                    }
                    
                    $route['params'] = $params;

                    return $route;
                }
            }
        }

        return null;
    }

    public function reverse(string $path): null|array
    {
        
        $prefix = $this->getPrefix($path);
       
        $uri = ltrim(preg_replace("#^/?" . preg_quote($prefix, '#') . "#", '', $path), '/');
        
        $routes = self::$routes[$prefix];

        $route = $this->matchRoute($uri, $routes);

        if(!$route)
        {
            return null;
        }
        
      
        return [
            'prefix'        => $prefix,
            'controller'    => $route['url']['controller'] ?? null,
            'action'        => $route['url']['action'] ?? null,
            'params'        => $route['params'] ?? null
        ];
    }

    

}
