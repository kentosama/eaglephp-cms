<div class="is-grouped">
    <?= $this->html->link("Add company", ['action' => 'add'], ['class' => 'button is-primary']) ?>
</div>

<table class="table is-fullwidth is-hoverable">
    <thead>
        <tr>
            <th><?= $this->paginator->order('id') ?></th>
            <th><?= $this->paginator->order('name') ?></th>
            <th><?= $this->paginator->order('slug') ?></th>
            <th><?= $this->paginator->order('is_manufacturer') ?></th>
            <th><?= $this->paginator->order('is_publisher') ?></th>
            <th><?= $this->paginator->order('is_developer') ?></th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($companies): foreach ($companies as $company): ?>
                <tr>
                    <th><?= $company->id ?></th>
                    <th><?= $company->name ?></th>
                    <th><?= $company->slug ?></th>
                    <th><?= $company->is_manufacturer ? 'yes' : '-' ?></th>
                    <th><?= $company->is_publisher ? 'yes' : '-' ?></th>
                    <th><?= $company->is_developer ? 'yes' : '-' ?></th>
                    <th>
                        <?= $this->html->action('edit', ['action' => 'edit', 'id' => $company->id]) ?>
                        <?= $this->html->action('delete', ['action' => 'delete', 'id' => $company->id]) ?>
                    </th>
                </tr>
        <?php endforeach;
        endif; ?>
    </tbody>
</table>
<nav class="pagination is-centered" role="navigation" aria-label="pagination">
    <?= $this->paginator->numbers() ?>
</nav>