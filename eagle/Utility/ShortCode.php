<?php
namespace Eagle\Utility;

class ShortCode
{
    protected static $shortcodes = [];

    public static function add($name, $callback)
    {
        self::$shortcodes[$name] = $callback;
    }

    public static function remove($name)
    {
        unset(self::$shortcodes[$name]);
    }

    private static function parseParams(string $str)
    {
        $params = [];
        // Expression régulière pour capturer chaque paramètre clé="valeur"
        preg_match_all('/(\w+)="([^"]+)"/', $str, $matches, PREG_OFFSET_CAPTURE);

        foreach ($matches[1] as $index => $match) {
            $params[$match[0]] = $matches[2][$index][0];
        }

        return $params;
    }

    public static function parse(string $content): string
    {
        // Lire les shortcodes ouverts/fermés d'abord (gallery, etc.)
        $content = preg_replace_callback('/{{<\s*(\w+)([^>]*)>}}(.*?){{<\s*\/\1\s*>}}/s', function ($matches) {
            $shortcode = $matches[1];      // gallery
            $paramStr = $matches[2] ?? ''; // paramètres (ex: id="1")
            $innerContent = $matches[3] ?? ''; // contenu à l'intérieur

            $params = self::parseParams($paramStr);
            $params['content'] = trim($innerContent); // On ajoute le contenu intérieur aux paramètres

            if (isset(self::$shortcodes[$shortcode])) {
                $callback = self::$shortcodes[$shortcode];
                return call_user_func($callback, $params);
            }

            return $matches[0];
        }, $content) ?? $content;

       

        // Lire ensuite les shortcodes auto-fermés (image, etc.)
        $content = preg_replace_callback('/{{<\s*(\w+)([^>]*)\>}}/s', function ($matches) {
            $shortcode = $matches[1];     // image
            $paramStr = $matches[2] ?? ''; // paramètres

            $params = self::parseParams($paramStr);

            if (isset(self::$shortcodes[$shortcode])) {
                $callback = self::$shortcodes[$shortcode];
                return call_user_func($callback, $params);
            }

            return $matches[0];
        }, $content) ?? $content;

        return $content;
    }


}