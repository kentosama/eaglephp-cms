<?php

namespace Eagle;

use Exception;
use Throwable;

class ErrorException extends Exception {

    public function __construct(string $message = "", int $code = 500, ?Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }

    public function display()
    {
        if (php_sapi_name() === 'cli') {
            // Affichage en CLI
            echo "[Error {$this->getCode()}] {$this->getMessage()}\n";
            echo "File: {$this->getFile()} on line {$this->getLine()}\n";
            echo "Trace:\n" . $this->getTraceAsString() . "\n";
        } else {
            // Affichage dans le navigateur
            echo "<h1>Erreur {$this->getCode()}</h1>";
            echo "<p><strong>Message :</strong> {$this->getMessage()}</p>";
            echo "<p><strong>Fichier :</strong> {$this->getFile()}</p>";
            echo "<p><strong>Ligne :</strong> {$this->getLine()}</p>";
            echo "<pre style='background:#f5f5f5; padding:10px; border:1px solid #ccc;'>"
                . $this->getTraceAsString()
                . "</pre>";
        }
        exit;
    }

}