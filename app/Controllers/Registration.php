<?php

namespace App\Controllers;

use App\Models\Cities;

class Registration extends BaseController
{
    
    public function Index()
    {
        $cities = new Cities();
        $data['cities'] = $cities->getAllCity();
        return view('site/registration', $data);
    }
    
   
    public function Save()
    {
        
        //include helper form
        helper(['form']);
        
        //set rules validation form
        $rules = [
            'name'          => 'required|min_length[3]|max_length[20]',
            'email'         => 'required|min_length[6]|max_length[50]|valid_email|is_unique[users.user_email]',
            'password'      => 'required|min_length[6]|max_length[200]',
            'confpassword'  => 'matches[password]'
        ];
          
        if($this->validate($rules)){
            $model = new UserModel();
            $data = [
                'user_name'     => $this->request->getVar('name'),
                'user_email'    => $this->request->getVar('email'),
                'user_password' => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT)
            ];
            $model->save($data);
            return redirect()->to('/login');
        }else{
            $data['validation'] = $this->validator;
            echo view('register', $data);
        }
       
    }
}