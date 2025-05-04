<!DOCTYPE html>
<html>
    <head>
    <?= $this->html->charset() ?>
    <?= $this->html->viewport() ?>
    <?= $this->html->meta(['http-equiv' => 'X-UA-Compatible', 'content' => 'IE=edge']); ?>
    
    <?= $this->html->css('https://necolas.github.io/normalize.css/8.0.1/normalize.css') ?>
    <?= $this->html->css('/vendor/fontawesome/css/all.min.css') ?>
    <?= $this->html->css('styles.min.css') ?>
    <?= $this->fetch('css') ?>


    </head>
    <body>
        <?php $this->cell('Navigation') ?>
        <div class="container">
            <main class="main">
                <div class="content">
                    <?= $this->content() ?>
                </div>
                
                <aside class="sidebar">
                <?php $this->cell('Sidebar') ?>
                </aside>
            </main>
        </div>
        <?php $this->cell('Footer') ?>
    </body>
</html>