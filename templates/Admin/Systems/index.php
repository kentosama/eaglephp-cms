<div class="is-grouped">
    <?= $this->html->link("Add system", ['action' => 'add'], ['class' => 'button is-primary']) ?>
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
        <?php if ($systems): foreach ($systems as $system): ?>
            <tr>
                <th><?= $system->id ?></th>
                <th><?= $system->name ?></th>
                <th><?= $system->slug ?></th>
                <th>
                    <?= $this->html->action('edit', ['action' => 'edit', 'id' => $system->id]) ?>
                    <?= $this->html->action('delete', ['action' => 'delete', 'id' => $system->id]) ?>
                </th>
            </tr>
        <?php endforeach; endif; ?>
    </tbody>
</table>