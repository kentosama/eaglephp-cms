<?php

namespace Eagle\Utility;

use Imagick;

class Image {

    protected $type;
    protected $width;
    protected $height;
    protected $filename;
    protected $path;
    protected $resource;
    protected $metadata = [];

    public function __construct(string $path)
    {
        if (!file_exists($path)) {
            throw new \InvalidArgumentException("Fichier introuvable : $path");
        }

        $this->path = $path;
        $this->filename = basename($this->path);
        $info = getimagesize($path);
        $this->type = $info['mime'];
        $this->width = $info[0];
        $this->height = $info[1];

        switch ($this->type) {
            case 'image/jpeg':
                $this->resource = imagecreatefromjpeg($path);
                break;
            case 'image/png':
                $this->resource = imagecreatefrompng($path);
                break;
            case 'image/webp':
                $this->resource = imagecreatefromwebp($path);
                break;
            default:
                throw new \RuntimeException("Format non supporté : {$this->type}");
        }

        $this->setMetadata();
    }

    public function getType():string
    {
        return $this->type;
    }

    public function getWidth(): int
    {
        return $this->width;
    }

    public function getHeight(): int 
    {
        return $this->height;
    }

    public function getMetaData(): array
    {
        return $this->metadata;
    }

    public static function getRandomFileName(string $ext = 'webp'): string
    {
        return date('Ymd') . '_' . bin2hex(random_bytes(5)) . '.' . $ext;
    }

    public function is(string $type): bool
    {
        return $this->type === $type;
    }

    protected function setMetadata(): void
    {

        $meta = [
            'title' => '',
            'description' => '',
            'tags' => '',
        ];

        if ($this->type === 'image/png') {
            if (class_exists('\Imagick')) {
                $image = new \Imagick($this->path);
                $properties = $image->getImageProperties('*'); // Récupérer toutes les propriétés
                
                // Retourner des métadonnées pertinentes
                $meta = [
                    'title' => $properties['image:title'] ?? null,
                    'description' => $properties['image:description'] ?? null,
                    'tags' => $properties['image:keywords'] ?? null,
                ];
            }
        } else if ($this->type === 'image/jpeg') {
            if (function_exists('exif_read_data')) {
                $exif = exif_read_data($this->path);
    
                // Vérifier si des données EXIF existent et extraire les informations
                $meta = [
                    'title' => $exif['ImageDescription'] ?? null,
                    'description' => $exif['COMPUTED']['UserComment'] ?? null,
                    'tags' => $exif['Keywords'] ?? null,
                ];
            }
        } else if ($this->type === 'image/webp') {
            if (class_exists('Imagick')) {
                $image = new \Imagick($this->path);
                $properties = $image->getImageProperties('*');
    
                // WebP ne possède généralement pas d'EXIF, donc on peut se limiter à des propriétés génériques
                $meta = [
                    'title' => $properties['image:title'] ?? null,
                    'description' => $properties['image:description'] ?? null,
                    'tags' => $properties['image:keywords'] ?? null,
                ];
            }
        }

        

        $this->metadata = $meta;
    }

    protected function calculateOffset(int $cropWidth, int $cropHeight, string $position): array
    {
        $x = 0;
        $y = 0;

        switch ($position) {
            case 'top-left':
                $x = 0;
                $y = 0;
                break;
            case 'top-center':
                $x = intval(($this->width - $cropWidth) / 2);
                $y = 0;
                break;
            case 'top-right':
                $x = $this->width - $cropWidth;
                $y = 0;
                break;
            case 'center':
                $x = intval(($this->width - $cropWidth) / 2);
                $y = intval(($this->height - $cropHeight) / 2);
                break;
            case 'left':
            case 'center-left':
                $x = 0;
                $y = intval(($this->height - $cropHeight) / 2);
                break;
            case 'right':
            case 'center-right':
                $x = $this->width - $cropWidth;
                $y = intval(($this->height - $cropHeight) / 2);
                break;
            case 'bottom-left':
                $x = 0;
                $y = $this->height - $cropHeight;
                break;
            case 'bottom-center':
                $x = intval(($this->width - $cropWidth) / 2);
                $y = $this->height - $cropHeight;
                break;
            case 'bottom-right':
                $x = $this->width - $cropWidth;
                $y = $this->height - $cropHeight;
                break;
            default:
                // Fallback sur center
                $x = intval(($this->width - $cropWidth) / 2);
                $y = intval(($this->height - $cropHeight) / 2);
                break;
        }

        return [$x, $y];
    }



    public function crop(int $width, int $height, string|array $offset = 'center'): self
    {
        if ($width >= $this->width && $height >= $this->height) {
            return $this;
        }

        if (is_string($offset)) {
            [$x, $y] = $this->calculateOffset($width, $height, $offset);
        } else {
            [$x, $y] = $offset;
        }

        $src = $this->resource;
        $dst = imagecreatetruecolor($width, $height);

        imagecopy(
            $dst, $src,
            0, 0, // destination x, y
            $x, $y, // source x, y
            $width, $height
        );

        imagedestroy($this->resource);
        $this->resource = $dst;
        $this->width = $width;
        $this->height = $height;

        return $this;
    }

    public function fit(int $maxWidth, int $maxHeight): self
    {
        $ratio = $this->width / $this->height;

        if ($maxWidth / $maxHeight > $ratio) {
            $newHeight = $maxHeight;
            $newWidth = intval($maxHeight * $ratio);
        } else {
            $newWidth = $maxWidth;
            $newHeight = intval($maxWidth / $ratio);
        }

        return $this->resize($newWidth, $newHeight);
    }

    public function fill(int $targetWidth, int $targetHeight, string $position = 'center'): self
    {
        // Calcul de ratio
        $srcRatio = $this->width / $this->height;
        $targetRatio = $targetWidth / $targetHeight;

        if ($srcRatio > $targetRatio) {
            // Trop large : on crop sur la largeur
            $newHeight = $targetHeight;
            $newWidth = intval($targetHeight * $srcRatio);
        } else {
            // Trop haut : on crop sur la hauteur
            $newWidth = $targetWidth;
            $newHeight = intval($targetWidth / $srcRatio);
        }

        // Redimensionner
        $this->resize($newWidth, $newHeight);

        return $this->crop($targetWidth, $targetHeight, $position);
    }


    public function resize(int $newWidth, int $newHeight): self
    {
        $src = $this->resource;
        $dst = imagecreatetruecolor($newWidth, $newHeight);

        imagecopyresampled(
            $dst, $src,
            0, 0, 0, 0,
            $newWidth, $newHeight,
            $this->width, $this->height
        );

        imagedestroy($this->resource);
        $this->resource = $dst;
        $this->width = $newWidth;
        $this->height = $newHeight;

        return $this;
    }

    public function save(string $path, string $format = 'webp', int $quality = 85, array $metadata = []): bool
    {
        $success = false;

        switch (strtolower($format)) {
            case 'jpeg':
            case 'jpg':
                $success = imagejpeg($this->resource, $path, $quality);
                break;
            case 'png':
                $success = imagepng($this->resource, $path);
                break;
            case 'webp':
                $success = imagewebp($this->resource, $path, $quality);
                break;
            default:
                throw new \Exception("Unsupported format: $format");
        }

        return $success;
    }
}