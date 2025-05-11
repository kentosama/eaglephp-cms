<div class="is-grouped">
    <?= $this->html->link("Add tag", ['action' => 'add'], ['class' => 'button is-primary']) ?>
</div>



<table class="table is-fullwidth is-hoverable">
    <thead>
        <tr>
            <th><?= $this->paginator->order('id') ?></th>
            <th><?= $this->paginator->order('name') ?></th>
            <th><?= $this->paginator->order('slug') ?></th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($tags): foreach ($tags as $tag): ?>
            <tr>
                <th><?= $tag->id ?></th>
                <th><?= $tag->name ?></th>
                <th><?= $tag->slug ?></th>
                <th>
                <?= $this->html->action('edit', ['action' => 'edit', 'id' => $tag->id]) ?>
                <?= $this->html->action('delete', ['action' => 'delete', 'id' => $tag->id]) ?>
                </th>
            </tr>
        <?php endforeach; endif; ?>
    </tbody>
</table>