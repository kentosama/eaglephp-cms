<div class="is-grouped">
    <?= $this->html->link("Add user", ['action' => 'add'], ['class' => 'button is-primary']) ?>
</div>

<table class="table is-fullwidth is-hoverable">
    <thead>
        <tr>
            <th><?= $this->paginator->order('id') ?></th>
            <th><?= $this->paginator->order('username') ?></th>
            <th><?= $this->paginator->order('email') ?></th>
            <th><?= $this->paginator->order('role') ?></th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($users): foreach ($users as $user): ?>
            <tr>
                <th><?= $user->id ?></th>
                <th><?= $user->username ?></th>
                <th><?= $user->email ?></th>
                <th><?= $user->role ?></th>
                <th>
                    <?= $this->html->action('edit', ['action' => 'edit', 'id' => $user->id]) ?>
                    <?= $this->html->action('delete', ['action' => 'delete', 'id' => $user->id]) ?>
                </th>
            </tr>
        <?php endforeach; endif; ?>
    </tbody>
</table>