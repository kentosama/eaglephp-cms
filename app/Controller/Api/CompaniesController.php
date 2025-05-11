<?php
namespace App\Controller\Admin;

use App\Controller\AppController;

class CompaniesController extends AppController
{
    public function initialize(): void
    {

    }

    public function search(): void
    {
         if ($this->request->is('POST')) {
            
            $data =$this->request->getData();

            $conditions = ['Companies.name LIKE' => '%' . $data['name'] . '%'];
        
           
            if (isset($data['conditions'])) {
                $c = json_decode($data['conditions'], true); 
                foreach ($c as $key => $value) {
                    
                    $conditions[sprintf('Companies.%s', $key)] = $value;
                 
                }
            }


            $companies = $this->Companies->findAll()
            ->conditions($conditions)
            ->execute();

            $results = [];
            foreach($companies as $company)
            {
                $results[] = $company->toArray();
            }

            echo json_encode($results);

        }
    }
}