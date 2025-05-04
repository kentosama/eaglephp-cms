<?php 
namespace Eagle\Utility;

class Time
{
   
    public static function now(): string
    {
        return date('Y-m-d H:i:s');
    }

    public static function format(string $date, string $format = 'Y-m-d H:i:s'): string
    {
        $timestamp = strtotime($date);
        return $timestamp ? date($format, $timestamp) : 'Invalid Date';
    }

    public static function addDays(string $date, int $days): string
    {
        $timestamp = strtotime($date);
        if ($timestamp === false) {
            return 'Invalid Date';
        }

        return date('Y-m-d H:i:s', strtotime("+$days days", $timestamp));
    }

    public static function diffInDays(string $startDate, string $endDate): int
    {
        $startTimestamp = strtotime($startDate);
        $endTimestamp = strtotime($endDate);

        if ($startTimestamp === false || $endTimestamp === false) {
            return -1;  // Indiquer une erreur ou une valeur invalide
        }

        $diff = abs($endTimestamp - $startTimestamp);
        return floor($diff / (60 * 60 * 24));  // Retourne la différence en jours
    }

    public static function minutesToReading(int $minutes, string $suffix = ''): string
    {
        if (empty($suffix)) {
            $suffix = 'min de lecture';
        }

        $time = $minutes;

        if ($minutes >= 60) {
            $time = round($minutes / 60, 1);
            $suffix = str_replace('min', 'h', $suffix);
        }

        return str_replace(['{{time}}', '{{suffix}}'], [$time, $suffix], '{{time}} {{suffix}}');
    }
}
