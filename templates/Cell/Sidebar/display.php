
<?php if (isset($widgets['author'])): $author = $widgets['author']['author']?>
<div class="sidebar-item sidebar-author">
    <div class="sidebar-content centered-content">
        <div class="sidebar-author-avatar">
        
          <?= $this->html->image($author->avatar, ['class' => 'author-avatar']) ?>
        </div>

        <h2 class="author-username"><?= $author->username ?></h2>
        <p class="author-motto"><?= $author->motto ?></p>
        <p class="author-description"><?= $author->description ?></p>

        <div class="social">
          <a href="" class="social-item"><i class="social-icon fa-brands fa-twitter" data-lucide="twitter"></i></a>
          <a href="" class="social-item"><i class="social-icon fa-brands fa-twitch" data-lucide="twitch"></i></a>
          <a href="" class="social-item"><i class="social-icon fa-brands fa-youtube" data-lucide="youtube"></i></a>
        </div>
    </div>
</div>
<?php endif ?>



<?php if (isset($widgets['lastReviews'])): ?>
<div class="sidebar-item">
    <div class="sidebar-content">
      <h2 class="sidebar-title">Derniers tests</h2>
      <ul>
        <?php $last_reviews = $widgets['lastReviews']['articles'] ?>

        <?php foreach($last_reviews as $article): ?>
          <li>
            <?= $this->html->link($article->title, ['controller' => 'articles', 'action' => 'view', 'type' => $article->type->slug, 'slug' => $article->slug]) ?>
          </li>
          <?php endforeach ?>
      </ul>
    </div>
  </div>
<?php endif ?>
