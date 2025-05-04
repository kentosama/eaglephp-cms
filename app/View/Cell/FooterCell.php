<?php

namespace App\View\Cell;
use Eagle\View\Cell;
use Eagle\ORM\TableRegistry;

class FooterCell extends Cell
{
    

    public function display()
    {
        $articleTable = TableRegistry::get('articles');

        $last = $articleTable->find('first')
        ->select(['Articles.id', 'Articles.created', 'Articles.modified'])
        ->order('created', 'DESC')->read();
        
        $this->set('last_modified', $last->modified);
    }

}