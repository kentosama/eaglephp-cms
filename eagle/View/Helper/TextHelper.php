<?php

namespace Eagle\View\Helper;
use Eagle\View\Helper;

use Eagle\Utility\Text;

class TextHelper extends Helper
{

    public function excerpt(string $text, int $limit = 60, string $ellipsis = '...'): string
    {
        if(empty($text)) return '';
        
        $text = $this->markdown($text);
        $text = strip_tags($text);

        $content = wordwrap($text, $limit);
        $content = explode("\n", $content);
        $content = $content[0] . $ellipsis;

        return $content;
    }

    public function markdown(string $text): string
    {
        if(empty($text)) return '';

        return Text::markdown($text);
    }


}