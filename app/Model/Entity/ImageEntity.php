<?php 

namespace App\Model\Entity;
use Eagle\ORM\Entity;

class ImageEntity extends Entity {
    
    protected $_visible = [
        'filename' => true,
        'filegroup' => true,
    ];

    protected $_virtual = [
        'fullpath' => true,
        'sizes' => true,
        'url' => true,
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
    
}