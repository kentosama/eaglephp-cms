<?= $this->form->create($article) ?>
<div class="columns">
    <div class="column is-9">
        <?= $this->form->input("title", ['label' => false, 'placeholder' => 'Title']) ?>
        <?= $this->form->textarea("content", ['label' => false, 'placeholder' => 'Content', 'class' => 'markdown-editor']) ?>
        <div class="field">
            <label for="tag-input-field" class="label">Tags</label>
            <div class="tag-input">
                <div class="tag-input-container">
                    <?php $ids = []; ?>
                    <?php if($article->has('tags')): ?> 
                    <?php foreach($article->tags as $tag): $ids[] = $tag->id ?>
                        <span data-id="<?= $tag->id ?>" class="tag-input-item"><?= $tag->name ?></span>
                    <?php endforeach; ?>
                    <?php endif ?>
                    <input type="text" id="tag-input-field" role="tag-input" class="tag-input-field" />
                    <input type="hidden" name="tags" id="tags" value="<?= implode(',', $ids) ?>" />
                </div>
                <div class="tag-input-results"></div>
            </div>
        </div>
    </div>
    <div class="column is-3">
        <div class="card">
            <div class="card-image">
                <figure class="image is-4by3">
                    <?= $this->html->image(DS.$article->image->thumb, ['id' => 'featured-image-preview', 'alt' => 'Aperçu de l\'image']) ?>

                </figure>
            </div>
            <div class="card-content">
                <button id="image-featured" class="button is-primary">Select image</button>
                <?= $this->form->input('image_id', ['type' => 'hidden', 'label' => false]); ?>
            </div>
        </div>

        <div class="card">
            <header class="card-header">
                <p class="card-header-title">Settings</p>
                <button class="card-header-icon" aria-label="more options">
                    <span class="icon">
                        <i class="fas fa-angle-down" aria-hidden="true">x</i>
                    </span>
                </button>
            </header>
            <div class="card-content">
                <?= $this->form->input('published_date', ['class' => 'datetimepicker']) ?>
                <?= $this->form->select('status', ['draft' => 'Draft', 'published' => 'Published'], ['label' => 'Status']) ?>
                <?= $this->form->select('visibility', ['public' => 'Public', 'private' => 'Private']) ?>
                <?= $this->form->input("slug") ?>
                <?= $this->form->select('type_id', $types, ['label' => 'Type']) ?>
                <?= $this->form->select('user_id', $authors, ['label' => 'Author']) ?>
                <?= $this->form->submit('Save') ?>
            </div>
        </div>
        <div class="card">
            <header class="card-header">
                <p class="card-header-title">SEO</p>
                <button class="card-header-icon" aria-label="more options">
                    <span class="icon">
                        <i class="fas fa-angle-down" aria-hidden="true">x</i>
                    </span>
                </button>
            </header>
            <div class="card-content">
                <?= $this->form->input('seo_title') ?>
                <?= $this->form->textarea('seo_description') ?>
                <?= $this->form->input('seo_keywords') ?>
            </div>
        </div>
    </div>
</div>


<?= $this->form->end() ?>