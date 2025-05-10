<?= $this->form->create($system) ?>
<?= $this->form->input('name', ['label' => 'Name', 'placeholder' => 'Tag name (ex: Genesis Does)']) ?>
<?= $this->form->input('slug', ['label' => 'Slug', 'placeholder' => 'Tag slug (ex: genesis-does']) ?>
<?= $this->form->input('description', ['label' => 'description', 'placeholder' => 'Short description']) ?>
<?= $this->form->submit('Save') ?>
<?= $this->form->end() ?>