<?php

namespace Eagle\Utility;

use Parsedown;

class Text {


    private static $_markdown;

    private static function getMarkdown(): Parsedown
    {
        if (self::$_markdown === null) {
            self::$_markdown = new Parsedown();
        }
        return self::$_markdown;
    }

    public static function sluggify(string $str, string $replacement = '-'): string
    {
        // Convertir en minuscules
        $str = strtolower($str);
    
        // Supprimer les accents
        $str = iconv('UTF-8', 'ASCII//TRANSLIT', $str);
        
        // Remplacer les caractères non alphanumériques par le séparateur
        $str = preg_replace('/[^a-z0-9]+/i', $replacement, $str);
    
        // Supprimer les séparateurs en double
        $str = preg_replace('/' . preg_quote($replacement, '/') . '+/', $replacement, $str);
    
        // Supprimer les séparateurs au début et à la fin
        $str = trim($str, $replacement);
    
        return $str;
    }

    public static function readingTime($content, $wordsPerMinute = 200) {
        // Supprimer les balises HTML
        $content = strip_tags($content);
    
        // Supprimer les shortcodes
        $content = preg_replace('/\[.*?\]/', '', $content);
    
        // Compter le nombre de mots
        $wordCount = str_word_count($content);
    
        // Calculer le temps de lecture
        $readingTime = ceil($wordCount / $wordsPerMinute); // Ce résultat est en minutes
    
        return $readingTime;
    }

    public static function mardownToRaw(string $content): string
    {
        $text = self::markdown($content);
        return strip_tags($text);
    }

    public static function markdown(string $content): string
    {
        return self::getMarkdown()->text($content);
    }


}