<!DOCTYPE html>
<html>

<head>
    <?= $this->html->charset() ?>
    <title><?= $this->fetch('title') ?></title>
    <?= $this->html->css("https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css") ?>
    <?= $this->html->css("https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css") ?>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/dark.css">
   

    <?= $this->html->css('/vendor/easymde/easymde.min.css') ?>
    <?= $this->html->css('/vendor/fontawesome/css/all.min.css') ?>
    <?= $this->html->css('/vendor/autocomplete/autocomplete.css') ?>
    <?= $this->html->css('/vendor/imagemanager/imagemanager.css') ?>
    <?= $this->html->css('/vendor/tag/tag.css') ?>
    <?= $this->html->css('admin.css') ?>
</head>

<body>
    <?= $this->element('admin-header') ?>
    <div class="container is-fluid">

        <?php $this->cell('AdminNavigation') ?>

        <main class="main">
            <div class="container">

                <h1 class="title"><?= $this->fetch('title') ?></h1>
                <h2 class="subtitle"><?= $this->fetch('description') ?></h2>

                <?php $this->content() ?>
            </div>
        </main>
    </div>

    <footer class="footer">
        <div class="content has-text-centered">
            <p>
                <strong>Bulma</strong> by <a href="https://jgthms.com">Jeremy Thomas</a>.
                The source code is licensed
                <a href="https://opensource.org/license/mit">MIT</a>. The
                website content is licensed
                <a href="https://creativecommons.org/licenses/by-nc-sa/4.0//">CC BY NC SA 4.0</a>.
            </p>
        </div>
    </footer>

    <?= $this->html->script('/vendor/autocomplete/autocomplete.js') ?>
    <script src="https://npmcdn.com/flatpickr/dist/l10n/fr.js"></script>
    <?= $this->html->script('https://cdn.jsdelivr.net/npm/flatpickr') ?>
    <?= $this->html->script('/vendor/easymde/easymde.min.js') ?>
    <?= $this->html->script('/vendor/imagemanager/imagemanager.js') ?>
    <?= $this->html->script('/vendor/tag/tag.js') ?>
    <?= $this->html->script('admin.js') ?>

    <?= $this->fetch('script') ?>

        

</body>

</html>