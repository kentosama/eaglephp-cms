<?php

namespace App\View\Cell;
use Eagle\View\Cell;
use Eagle\ORM\TableRegistry;

class SidebarCell extends Cell
{
    protected $defaultConfig = [];
    public $request;

    protected $widgets = [
    ];

    public function display()
    {
        $articleTable = TableRegistry::get('articles');
        $authorTable = TableRegistry::get('users');

        $author = $authorTable->find('first')->where('Users.username', 'kentosama')->read();        

        $this->widgets['author'] = [
            'title' => 'Author',
            'author' => $author, 
        ];

       
        $this->widgets['lastReviews'] = [
            'title' => 'Last Reviews',
            'articles' => $articleTable->find()
                ->contain(['Types', 'Images'])
                ->findReview()
                ->order('Articles.created', 'DESC')
                ->limit(5)
                ->readAll()
        ];

        $this->set('widgets', $this->widgets);

    }

   

}