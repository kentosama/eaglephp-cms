<?php

namespace App\Model\Table;

use Eagle\ORM\Table;
use Eagle\ORM\Entity;
use Eagle\Utility\Image;

class ImagesTable extends Table {

    protected $dir = WEBROOT . DS . MEDIA_DIR . DS . 'images';
    protected $thumbs = [
        'small' => ['width' => 96, 'height' => 96, 'crop' => true],
        'medium' => ['width' => 224, 'height' => 224, 'crop' => true],
        'large' => ['width' => 512, 'height' => 512, 'crop' => true],
    ];
    
    protected $sizes = [
        'small' => ['width' => 200, 'height' => 200, 'preserve_ratio' => true],
        'medium' => ['width' => 500, 'height' => 500, 'preserve_ratio' => true],
        'large' => ['width' => 800, 'height' => 800, 'preserve_ratio' => true],
    ];
    

    protected $types = [
        'any',
        'photos',
        'screenshots',
        'arts',
        'scans',
    ];

    public function initialize()
    {
        parent::initialize();

        $this->setTable('images');
        $this->setAlias('Images');
        $this->setPrimaryKey('id');
        $this->setDisplayKey('title');
        $this->behavior('Timestamp');

        if (!file_exists($this->dir)) {
            mkdir($this->dir);
        }

        
    }

    protected function beforeSave(Entity $entity): bool
    {
        parent::beforeSave($entity);
        
        if ($entity->file && is_uploaded_file($entity->file['tmp_name'])) {
            if ($entity->isNew()) {
                $ext = 'webp';
                $filename = Image::getRandomFileName($ext);
                $folder = $this->getNextFolder();
                $destinationFolder = $this->dir . DS . $folder;

                if (!is_dir($destinationFolder)) {
                    mkdir($destinationFolder, 0777, true);
                }

                $destinationPath = $destinationFolder . DS . $filename;
            } else {
                $folder = sprintf('%04d', $entity->filegroup);
                $filename = $entity->filename;
                $destinationPath = $this->dir . DS . $folder . DS . $filename;
            }

            $originalPath = $entity->file['tmp_name'];

            // Déplacer d'abord le fichier dans la bonne structure
            move_uploaded_file($originalPath, $destinationPath);

            // Ensuite, traiter l’image
            $image = new Image($destinationPath);
            $image->save($destinationPath);

            // Enregistrer les infos dans l'entité
            $entity->set('filename', $filename);
            $entity->set('filegroup', $folder);
            $entity->set('mime', $image->getType());
            $entity->set('width', $image->getWidth());
            $entity->set('height', $image->getHeight());
            $entity->set('filesize', filesize($destinationPath));
        }

       
        return true;
    }

    protected function afterSave(Entity $entity): void
    {
       
        if ($entity->isDirty('file')) {
            $folder = sprintf('%04d', $entity->filegroup);
            $path = $this->dir . DS . $folder . DS . $entity->filename;
            

            // thumbs
            foreach($this->thumbs as $format => $setting)
            {   
                $thumb = new Image($path);
                $destination = $this->dir . DS . 'thumbs' . DS . $folder . DS . $format;
                if(!file_exists($destination))
                    mkdir($destination, 0777, true);

                $destination .= DS . $entity->filename;
                
                if ($setting['crop'])
                    $thumb->fill($setting['width'], $setting['height']);
                else
                    $thumb->fit($setting['width'], $setting['height']);

                $thumb->save($destination);
            }

            foreach($this->sizes as $format => $setting)
            {   
                $size = new Image($path);
                $destination = $this->dir . DS . 'sizes' . DS . $folder . DS . $format;

                if(!file_exists($destination))
                    mkdir($destination, 0777, true);

                $destination .= DS . $entity->filename;
            
                $size->fit($setting['width'], $setting['height']);

                $size->save($destination);
            }
        }
        
    }



    private function getNextFolder():string
    {
        $basePath = $this->dir; // ex: media/
        $i = 1;

        while (true) {
            $folder = str_pad($i, 4, '0', STR_PAD_LEFT); // 0001, 0002, etc.
            $folderPath = $basePath . DS . $folder;

            if (!is_dir($folderPath)) {
                mkdir($folderPath, 0755, true);
                return $folder;
            }

            // Count number of files in folder
            $files = array_diff(scandir($folderPath), ['.', '..']);
            if (count($files) < 1024) {
                return $folder;
            }

            $i++;
        }
    }
}