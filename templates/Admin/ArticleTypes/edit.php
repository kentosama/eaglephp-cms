<?= $this->form->create($articleType) ?>

<?= $this->form->input('name', ['label' => 'Name', 'placeholder' => 'Article type name']) ?>
<?= $this->form->input('slug', ['label' => 'Slug', 'placeholder' => 'Article type slug']) ?>
<?= $this->form->input('description', ['label' => 'description', 'placeholder' => 'Short description']) ?>
<?= $this->form->select('content_type', ['article' => 'Article', 'feature' => 'Feature', 'story' => 'Story', 'tutorial' => 'Tutorial', 'review' => 'Review'], ['label' => true]) ?>
<?= $this->form->submit('Save') ?>
<?= $this->form->end() ?>