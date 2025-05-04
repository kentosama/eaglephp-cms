<?php foreach ($users as $user) {
     
    foreach ($user->articles as $article) {
       
        echo "<h2>{$article->title}</h2>";
        echo $this->html->image($article->image->url);

        

        foreach($article->tags as $tag)
            echo $tag->name . '<br>';

      

    }
}
