<div class="is-grouped">
    <?= $this->html->link("Add genre", ['action' => 'add'], ['class' => 'button is-primary']) ?>
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
        <?php if ($genres): foreach ($genres as $genre): ?>
            <tr>
                <th><?= $genre->id ?></th>
                <th><?= $genre->name ?></th>
                <th><?= $genre->slug ?></th>
                <th>
                    <?= $this->html->action('edit', ['action' => 'edit', 'id' => $genre->id]) ?>
                    <?= $this->html->action('delete', ['action' => 'delete', 'id' => $genre->id]) ?>
                </th>
            </tr>
        <?php endforeach; endif; ?>
    </tbody>
</table>