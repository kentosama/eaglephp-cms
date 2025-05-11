<?php 

namespace App\Model\Entity;
use Eagle\ORM\Entity;
use Eagle\Utility\Image;

class ImageEntity extends Entity {
    
    protected array $_accessible = [
        '*' => true,
        'id' => false,
        'file' => true,
    ];

    protected array $_virtual = [
        'fullpath',
        'sizes',
        'url',
        'thumb',
    ];

    public function getUrl(): string
    {
        return sprintf("/media/images/%04d/%s", $this->filegroup, $this->filename);
    }

    public function size(string $size = 'medium'): string
    {
        return sprintf("/media/images/sizes/%04d/{$size}/%s", $this->filegroup, $this->filename);
    }

    public function getSizes(): array {
        $basepath = sprintf("/media/images/sizes/%04d", $this->filegroup);
        $sizes = [];
        
        // Générer les tailles
        foreach (['small', 'medium', 'large'] as $size) {
            // Ajouter chaque taille au tableau associatif
            $sizes[$size] = $basepath . DS . $size . DS . $this->filename; 
        }
    
        return $sizes;
    }

    protected function generateThumbnails() {
        $thumbs = [
            'small' => ['width' => 96, 'height' => 96, 'crop' => true],
            'medium' => ['width' => 224, 'height' => 224, 'crop' => true],
            'large' => ['width' => 512, 'height' => 512, 'crop' => true],
        ];

        $dir = WEBROOT . DS . MEDIA_DIR . DS . 'images';
        $path = sprintf('%s/%04d/%s', $dir, $this->filegroup, $this->filename);

        if(!file_exists($path))
        return;

        foreach($thumbs as $format => $setting)
        {   
            $destination = sprintf('%s/thumbs/%04d/%s', $dir, $this->filegroup, $format);
      
            $thumb = new Image($path);
            
            if(!file_exists($destination))
                mkdir($destination, 0777, true);

            $destination .= DS . $this->filename;
            
            if ($setting['crop'])
                $thumb->fill($setting['width'], $setting['height']);
            else
                $thumb->fit($setting['width'], $setting['height']);

            $thumb->save($destination);
        }


    }

    protected function getThumb()
    {
        $path = sprintf('media/images/thumbs/%04d/medium/%s', $this->filegroup, $this->filename);
        if(!file_exists(WEBROOT . DS .$path))
        {
            
            $this->generateThumbnails();
        }

        return $path;
    }

    
}