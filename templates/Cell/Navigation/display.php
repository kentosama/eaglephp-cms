<nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="container">
        <div class="navbar-wrapper">
        <div class="navbar-brand">
            
            <?= $this->html->link('SEGA GEN', ['controller' => 'pages', 'action' => 'home'], ['class' => 'navbar-item']) ?>
            <!-- Hamburger -->
            <button class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navMenu">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </button>
            
        </div>
        <div class="navbar-items" id="nav-menu">
     
            <?php foreach($types as $type): ?>
                <?= $this->html->link($type->plurialize, ['controller' => 'articles', 'action' => 'index', 'type' => $type->slug], ['class' => 'navbar-item']) ?>
            <?php endforeach ?>
            <div class="navbar-item has-dropdown">
                <a class="navbar-link">
                    Systèmes
                    <span class="chevron">&#9660;</span> <!-- Chevron -->
                </a>                
                <div class="navbar-dropdown">
                    <?php foreach($systems as $system): ?>
                  
                    <?= $this->html->link($system->name, ['controller' => 'articles', 'action' => 'system', 'slug' => $system->slug], ['class' => 'navbar-item']) ?>
                    <?php endforeach ?>
                </div>
            </div>
            
        </div>
        </div>
    </div>
</nav>