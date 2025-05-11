<?php

namespace App\Controller\Admin;

use App\Controller\AppController;

use Eagle\Exceptions\NotFoundException;

class ArticlesController extends AppController {

    public function initialize()
    {
        parent::initialize();
    }

    public function index()
    {

        $query = $this->Articles->find('all')
        ->contain(['Images', 'Tags', 'Authors', 'Types', 'Systems',]);

        $articles = $this->Paginator->paginate($query);

        $this->set('articles', $articles);
    }

    public function add(): void
    {
        $article = $this->Articles->createEntity();

        if($this->request->is('POST')) {
            $article = $this->Articles->patchEntity($article, $this->request->getData());
            if($this->Articles->save($article)) {
                $this->redirect(['action' => 'index']);
            }
        }

        $types = $this->Articles->Types->findList();
        $systems = $this->Articles->Systems->findList();
        $authors = $this->Articles->Authors->findList();

        $this->set('article', $article);
        $this->set('types', $types);
        $this->set('systems', $systems);
        $this->set('authors', $authors);
    }

    public function edit(int $id): void
    {
        $article = $this->Articles->findById($id)->contain(['Images', 'Types', 'Authors', 'Systems', 'Tags']);

        if($this->request->is('POST')) {

            $data = $this->request->getData();

            if(isset($data['tags'])) {
                $tags = $data['tags'];
                $data['tags_ids'] = [];
                unset($data['tags']);
                if(!empty($tags)) {
                    $tags = explode(',', $tags);
                    $data['tags_ids'] = $tags;
                }
            }
            $article = $article->read();
            $article = $this->Articles->patchEntity($article, $data);
            if($this->Articles->save($article)) {
                $this->redirect(['action' => 'index']);
            }
        }

        $types = $this->Articles->Types->findList();
        $systems = $this->Articles->Systems->findList();
        $authors = $this->Articles->Authors->findList();

        $this->set('article', $article);
        $this->set('types', $types);
        $this->set('systems', $systems);
        $this->set('authors', $authors);
    }

    public function view(string $type, string $slug)
    {
        $query = $this->Articles->find('first');
        $article = $query->matching('Types', function($q) use ($type) { $q->where('Types.slug', $type);}) 
        ->where('Articles.slug', $slug)->contain(['Images', 'Types'])->readOne();

        if(!$article)
            throw new NotFoundException("Article not found");

        $this->set('article', $article);

        
    }

}