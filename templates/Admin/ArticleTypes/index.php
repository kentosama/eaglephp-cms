<div class="is-grouped">
    <?= $this->html->link("Add article type", ['action' => 'add'], ['class' => 'button is-primary']) ?>
</div>



<table class="table is-fullwidth is-hoverable">
    <thead>
        <tr>
            <th><?= $this->paginator->order('id') ?></th>
            <th><?= $this->paginator->order('name') ?></th>
            <th><?= $this->paginator->order('slug') ?></th>
            <th><?= $this->paginator->order('content_type') ?></th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($articleTypes): foreach ($articleTypes as $articleType): ?>
            <tr>
                <th><?= $articleType->id ?></th>
                <th><?= $articleType->name ?></th>
                <th><?= $articleType->slug ?></th>
                <th><?= $articleType->content_type ?></th>
                <th>
                <?= $this->html->action('edit', ['action' => 'edit', 'id' => $articleType->id]) ?>
                <?= $this->html->action('delete', ['action' => 'delete', 'id' => $articleType->id]) ?>
                </th>
            </tr>
        <?php endforeach; endif; ?>
    </tbody>
</table>