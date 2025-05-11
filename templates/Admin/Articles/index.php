<?php use Eagle\Utility\Time; ?>

<div class="is-grouped">
    <?= $this->html->link("Add article", ['action' => 'add'], ['class' => 'button is-primary']) ?>
</div>


<table class="table is-fullwidth is-hoverable">
    <thead>
        <tr>
            <th><?= $this->paginator->order('id') ?></th>
            <th><?= $this->paginator->order('title') ?></th>
            <th><?= $this->paginator->order('type.name') ?></th>
            <th><?= $this->paginator->order('reading_time') ?></th>
            <th><?= $this->paginator->order('published_date', ['label' => 'Date']) ?></th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($articles): foreach ($articles as $article): ?>
            <tr>
                <th><?= $article->id ?></th>
                <th><?= $article->title ?></th>
                <th><?= $article->type->name ?></th>
                <th><?= Time::minutesToReading($article->reading_time, 'min') ?></th>
                <th><?= $article->published_date ? $article->published_date->format('d/m/Y') : '-' ?></th>
                <th>
                    <?= $this->html->action('edit', ['action' => 'edit', 'id' => $article->id]) ?>
                    <?= $this->html->action('delete', ['action' => 'delete', 'id' => $article->id]) ?>
                </th>
            </tr>
        <?php endforeach; endif; ?>
    </tbody>
</table>

<nav class="pagination is-centered" role="navigation" aria-label="pagination">
    <?= $this->paginator->numbers() ?>
</nav>