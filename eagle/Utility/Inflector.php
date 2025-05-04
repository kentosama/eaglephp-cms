<?php
namespace Eagle\Utility;

use Doctrine\Inflector\InflectorFactory;

class Inflector
{
    protected static $inflector;

    protected static function getInstance()
    {
        if (!self::$inflector) {
            self::$inflector = InflectorFactory::create()->build();
        }
        return self::$inflector;
    }

    public static function capitalize(string $word): string
    {
        return self::getInstance()->capitalize($word);
    }

    public static function camelize(string $word): string
    {
        return self::getInstance()->camelize($word);
    }

    public static function underscore(string $word): string
    {
        return self::getInstance()->tableize($word);
    }

    public static function classify(string $word): string
    {
        return self::getInstance()->classify($word);
    }

    public static function pluralize(string $word): string
    {
        return self::getInstance()->pluralize($word);
    }

    public static function singularize(string $word): string
    {
        return self::getInstance()->singularize($word);
    }

    public static function tableize(string $word): string
    {
        return self::getInstance()->tableize($word);
    }

    public static function inflect(string $word): string
    {
        return strtolower(self::pluralize($word));
    }

    public static function labelize(string $word): string
    {
        return ucwords(str_replace(['_', '-'], ' ', $word));
    }

    public static function fieldWithAlias(string $alias, string $field): string {

        $alias = self::pluralize(self::classify($alias));

        return "{$alias}." . strtolower(self::underscore($field));
    }

}
