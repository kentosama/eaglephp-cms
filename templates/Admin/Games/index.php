<div class="is-grouped">
    <?= $this->html->link("Add game", ['action' => 'add'], ['class' => 'button is-primary']) ?>
</div>


<table class="table is-fullwidth is-hoverable">
    <thead>
        <tr>
            <th><?= $this->paginator->order('id') ?></th>
            <th><?= $this->paginator->order('title') ?></th>
            <th><?= $this->paginator->order('publisher.name') ?></th>
            <th><?= $this->paginator->order('developer.name') ?></th>
            <th><?= $this->paginator->order('genre.name') ?></th>
            <th><?= $this->paginator->order('system.name') ?></th>
            <th><?= $this->paginator->order('release_date') ?></th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($games): foreach ($games as $game): ?>
                <tr>
                    <th><?= $game->id ?></th>
                    <th><?= $game->title ?></th>
                    <th><?= $game->has('publisher') ? $game->publisher->name : '-' ?></th>
                    <th><?= $game->has('developer') ? $game->developer->name : '-' ?></th>
                    <th><?= !is_null($game->genre) ? $game->genre->name : '-' ?></th>
                    <th><?= $game->system->name ?></th>
                    <th><?= $game->release_date ? $game->release_date->format('Y') : '-' ?></th>
                    <th>
                        <?= $this->html->action('edit', ['action' => 'edit', 'id' => $game->id]) ?>
                        <?= $this->html->action('delete', ['action' => 'delete', 'id' => $game->id]) ?>
                    </th>
                </tr>
        <?php endforeach;
        endif; ?>
    </tbody>
</table>
<nav class="pagination is-centered" role="navigation" aria-label="pagination">
    <?= $this->paginator->numbers() ?>
</nav>