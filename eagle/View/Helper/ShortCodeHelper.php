<?php
namespace Eagle\View\Helper;

use Eagle\View\Helper;
use Eagle\Utility\ShortCode;
use Eagle\ORM\TableRegistry;

use Eagle\View\Helper\HtmlHelper;

class ShortCodeHelper extends Helper
{
    protected $images;
    protected $html;

    public function initialize(array $config = []): void
    {
        parent::initialize($config);

        // Enregistrement des ShortCodes
        ShortCode::add('image', [$this, 'image']);
        ShortCode::add('images', [$this, 'images']);
        ShortCode::add('video', [$this, 'video']);
        ShortCode::add('audio', [$this, 'audio']);

        $this->images = TableRegistry::get('images');
        
    }

    public function image($params)
    {
        if(!isset($params['id'])) {
            return '';
        }

        $id = $params['id'];

        $image = $this->images->findById($id)->read();

        $img = $this->view->html->image($image->url, ['srcset' => $image->sizes]);
        $html = '<div class="image"><a href="' .$image->url . '" target="_blank" class="image-link">' . $img . '</a></div>';
        return $html;
    }

    public function images($params)
    {
        $html = '<div class="images"><div class="images-wrapper">{{content}}</div></div>';

        $content = ShortCode::parse($params['content']);
        $html = str_replace('{{content}}', $content, $html);
        return $html;
    }

    public function video($params)
    {
        return '<video controls><source src="' . $params['file'] . '" type="video/mp4"></video>';
    }

    public function audio($params)
    {
        return '<audio controls><source src="' . $params['file'] . '" type="audio/mpeg"></audio>';
    }

    public function parse(string $content): string
    {
        // Utilisation de la méthode parse de la classe ShortCode
        return ShortCode::parse($content);
    }

}