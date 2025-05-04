<?php

namespace Eagle\ORM;

use Medoo\Medoo;
use Eagle\ErrorException;
use PDO;

class Database {

    private static $instance = null;
    private $pdo = null;

    private function __construct()
    {
        $config = include APP_CONFIG . '/app.php';

        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ];

        $mysql = $config['database'];

        $host = $mysql['host'];
        $username = $mysql['username'];
        $password = $mysql['password'];
        $database = $mysql['database'];
        $port = $mysql['port'] ?? 3306;
        $charset = $mysql['charset'] ?? 'utf8mb4';

        $dsn = "mysql:host={$host};port={$port};dbname={$database};charset={$charset}";

        $this->pdo = new PDO($dsn, $username, $password, $options);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance->pdo;
    }

    public static function tableExists(string $tableName): bool
    {
        if (self::$instance === null) {
            return false;
        }

        try {
            $pdo = self::$instance->pdo;
            $stmt = $pdo->query("SHOW TABLES LIKE '{$tableName}'");
            return $stmt->rowCount() > 0;
        } catch (\PDOException $e) {
            return false;
        }
    }

    public static function describe(string $tableName): array
    {
        if (self::$instance === null) {
            return [];
        }

        try {
            $pdo = self::$instance->pdo;
            $stmt = $pdo->query("DESCRIBE {$tableName}");
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            return [];
        }
    }

    public static function isConnected(): bool
    {
        if (self::$instance === null) {
            return false;
        }

        try {
            // On récupère l'objet PDO via Medoo
            $pdo = self::$instance->pdo;
            $pdo->query('SELECT 1');
            return true;
        } catch (\PDOException $e) {
            return false;
        }
    }
}