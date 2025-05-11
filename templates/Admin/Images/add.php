<?= $this->form->create($image, ['type' => 'file']) ?>
<?= $this->form->input('title', ['label' => 'Title', 'placeholder' => 'Media title (example: Great game!)']) ?>
<?= $this->form->textarea('description', ['label' => 'Description', 'placeholder' => 'Short description of media']) ?>
<?= $this->form->select('type', ['image' => 'Image', 'photo' => 'Photo', 'art' => 'Art', 'screenshot' => 'Screenshot']) ?>
<?= $this->form->autocomplete('game_id', ['label' => 'Game','class' => 'autocomplete-game']) ?>
<?= $this->form->fileupload('file', ['label' => 'File', 'multiple' => true, 'accept' => 'image/png,image/jpeg,image/webp']); ?>
<?= $this->form->submit('Save') ?>
<?= $this->form->end() ?>