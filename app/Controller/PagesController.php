<?php

namespace App\Controller;

use Eagle\ORM\TableRegistry;

class PagesController extends AppController {

   public function home() 
   {
      $table = TableRegistry::get('articles');

      $query = $table->find('all')
      ->contain(['Types', 'Systems', 'Tags', 'Images'])
      ->order('Articles.published_date', 'DESC');

      $articles = $this->Paginator->paginate($query, ['limit' => 3]);

      $this->set('articles', $articles);
   }

   public function info() {
      echo phpinfo();
      die();
   }

}