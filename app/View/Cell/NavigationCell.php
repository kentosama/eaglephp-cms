<?php

namespace App\View\Cell;

use Eagle\ORM\TableRegistry;
use Eagle\View\Cell;

class NavigationCell extends Cell
{
    public function display(): void
    {
        $table = TableRegistry::get('article_types');
        
        $types = $table->findAll()->order('ArticleTypes.name', 'ASC');
        
        $systemTable = TableRegistry::get('systems');
        $systems = $systemTable->findAll()->order('Systems.name', 'ASC');

        $this->set('types', $types);
        $this->set('systems', $systems);
    }

}