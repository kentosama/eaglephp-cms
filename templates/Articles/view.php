<?php

use Eagle\Utility\Time; ?>

<article class="article article-single">
  <?php if ($article->has('image')): ?>
    <div class="article-image">
      <?= $this->html->image($article->image->url, ['srcset' => $article->image->sizes]) ?>
    </div>
  <?php endif ?>

  <div class="article-content">
    <div class="article-header">
      <div class="article-badges">
        <span class="article-badge article-type">
          <?= $this->html->link($article->type->name, ['controller' => 'articles', 'action' => 'index', 'type' => $article->type->slug]) ?>
        </span>
        <?php if ($article->has('systems')): ?>
          <?php foreach ($article->systems as $system): ?>
            <span class="article-badge">
              <?= $this->html->link($system->name, ['controller' => 'articles', 'action' => 'system', 'slug' => $system->slug]) ?>
            </span>
          <?php endforeach ?>
        <?php endif ?>
      </div>
      <h1 class="article-title"><?= $article->title ?></h1>
      <div class="article-meta">

        <span class="article-date">
          <i class="icon fa-regular fa-calendar"></i>
          <?= $article->published_date->format('d/m/Y') ?>
        </span>
        <span class="read-time">
          <i class="icon fa-regular fa-clock"></i>
          <?= Time::minutesToReading($article->reading_time, 'min') ?>
        </span>
      </div>
    </div>

    <div class="article-content-inner">
      <?php $content = $this->shortcode->parse($article->content); ?>
      <?= $this->text->markdown($content) ?>
    </div>


    <?php if ($article->has('tags')): ?>
      <div class="article-tags">

        <i class="fa-solid fa-tags"></i>
        <?php foreach ($article->tags as $tag): ?>
          <span class="article-tag">
            <?= $this->html->link($tag->name, ['controller' => 'tags', 'action' => 'view', 'slug' => $tag->slug]) ?>
          </span>
        <?php endforeach ?>

      </div>
    <?php endif ?>
  </div>
</article>