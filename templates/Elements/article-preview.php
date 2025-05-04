<article class="article article-preview">
    <?php if($article->has('image')): ?>
        <div class="article-image">
            <?= $this->html->image($article->image->url, ['srcset' => $article->image->sizes]) ?>
        </div>
        <?php endif ?>
    <div class="article-content">

        <div class="article-badges">
            <span class="article-badge article-type">
                <?= $this->html->link($article->type->name, ['controller' => 'articles', 'action' => 'index', 'type' => $article->type->slug]) ?>
            </span>
            <?php if($article->has('systems')): ?>
                <?php foreach($article->systems as $system): ?>
                    <span class="article-badge">
                        <?= $this->html->link($system->name, ['controller' => 'articles', 'action' => 'system', 'slug' => $system->slug]) ?>
                    </span>
                <?php endforeach ?>
            <?php endif ?>
        </div>
        
        <h2 class="article-title"><?= $this->html->link($article->title, ['controller' => 'articles', 'action' => 'view', 'type' => $article->type->slug, 'slug' => $article->slug]); ?> </h2>
        <div class="article-meta">
            <span class="article-date">
                <i class="icon fa-regular fa-calendar" data-lucide="calendar-clock"></i>
                <?= $article->published_date->format('d/m/Y') ?>
            </span>
            <span class="read-time">
                <i class="icon fa-regular fa-clock" data-lucide="clock-4"></i>
                <?= $article->reading_time < 1 ? "Moins d'1 min de lecture": sprintf("%d min de lecture", $article->reading_time) ?>
            </span>
        </div>
        <p class="summary"><?= $this->text->excerpt($article->content, 200); ?></p>
        <?php if($article->has('tags')): ?>
        <div class="article-tags">
    
            <i class="fa-solid fa-tags"></i>
            <?php foreach($article->tags as $tag): ?>
                <span class="article-tag">
                <?= $this->html->link($tag->name, ['controller' => 'articles', 'action' => 'tag', 'slug' => $tag->slug]) ?>
                </span>
            <?php endforeach ?>
            
        </div>
        <?php endif ?>
    </div>
</article>