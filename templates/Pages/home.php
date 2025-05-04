<section class="article-list">
    <?php foreach($articles as $article): ?>
        <?= $this->element('article-preview', ['article' => $article]) ?>
    <?php endforeach ?>
    <?= $this->element('pagination') ?>
</section>