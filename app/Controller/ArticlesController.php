<?php

namespace App\Controller;


use Eagle\Exceptions\NotFoundException;

class ArticlesController extends AppController {

    public function initialize()
    {
        parent::initialize();
    }

    public function index(string $type)
    {

        $query = $this->Articles->findAll()
        ->matching('Types', function($q) use ($type) { $q->where('Types.slug', $type);})
        ->contain(['Images', 'Tags', 'Authors', 'Types', 'Systems']);

        $articles = $this->Paginator->paginate($query);

        $this->set('articles', $articles);
    }

    public function system(string $slug)
    {
        $this->view->template = 'index';

        $query = $this->Articles->findAll()
        ->matching('Systems', function($q) use ($slug) { $q->where('Systems.slug', $slug);})
        ->contain(['Images', 'Tags', 'Authors', 'Types', 'Systems']);

        $articles = $this->Paginator->paginate($query);

        $this->set('articles', $articles);
    }

    public function tag(string $slug)
    {
        $this->view->template = 'index';

        $query = $this->Articles->findAll()
        ->matching('Tags', function($q) use ($slug) { $q->where('Tags.slug', $slug);})
        ->contain(['Images', 'Tags', 'Authors', 'Types', 'Systems']);

        $articles = $this->Paginator->paginate($query);

        $this->set('articles', $articles);
    }

    public function view(string $type, string $slug)
    {
        $query = $this->Articles->find('first');
        $article = $query->matching('Types', function($q) use ($type) { $q->where('Types.slug', $type);}) 
        ->where('Articles.slug', $slug)->contain(['Images', 'Types', 'Systems', 'Tags'])->readOne();

        if(!$article)
            throw new NotFoundException("Article not found");

        $this->set('article', $article);
    }

}