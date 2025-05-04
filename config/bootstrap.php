<?php

require_once dirname(__DIR__) . '/vendor/autoload.php';
require_once dirname(__DIR__) . '/config/path.php';
require_once dirname(__DIR__) . '/config/routes.php';

use Eagle\ErrorException;
use Eagle\ORM\Database;
use Eagle\Dispatcher;

try {
    
    $config = require_once ROOT . '/config/app.php';

    define('APP_DEBUG', $config['debug'] ?? true);
   
    $database = Database::getInstance();

    if (!Database::isConnected()) {
        throw new ErrorException('Erreur de connexion à la base de données : ' . $e->getMessage(), 500, $e);
    }

    $dispatcher = new Dispatcher();
    $dispatcher->dispatch();
    
} catch (\Eagle\ErrorException $e) {
    $e->display();
} catch (\Throwable $e) {
    // Gestion des erreurs non-Eagle
    $error = new \Eagle\ErrorException($e->getMessage(), intval($e->getCode()), $e);
    $error->display();
}

