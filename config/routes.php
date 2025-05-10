<?php

use Eagle\Router;

Router::scope('/', function () {
    return [
        ['path' => '/', 'url' => ['controller' => 'pages', 'action' => 'home']],
        ['path' => '/systems/:slug', 'url' => ['controller' => 'articles', 'action' => 'system'], 'pass' => ['slug']],
        ['path' => '/tags/:slug', 'url' => ['controller' => 'articles', 'action' => 'tag'], 'pass' => ['slug']],
        ['path' => '/articles/:type', 'url' => ['controller' => 'articles', 'action' => 'index'], 'pass' => ['type']],
        ['path' => '/articles/:type/:slug', 'url' => ['controller' => 'articles', 'action' => 'view'], 'pass' => ['type', 'slug']],
        ['path' => '/users', 'url' => ['controller' => 'users', 'action' => 'index']],

    ];
}, true);

Router::scope('/admin', function () {
    return [
        ['path' => '/', 'url' => ['controller' => 'pages', 'action' => 'home']],
        ['path' => '/articles', 'url' => ['controller' => 'articles', 'action' => 'index']],
    ];
}, true);


Router::scope('/api', function () {
    return [
        ['path' => '/', 'url' => ['controller' => 'pages', 'action' => 'home']],
    ];
}, true);
