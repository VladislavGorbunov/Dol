<?php

namespace App\Controllers;

use Config\Services;
use App\Models\RepresentativesModel;

class EmailController extends BaseController
{
    private $session;
    private $admin_email;
    private $subject_reg;
    private $subject_add_camp;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $this->session = session();
        $this->admin_email = 'info@bycamps.ru';
        $this->subject_reg = 'Регистрация нового пользователя';
        $this->subject_add_camp = 'Добавление нового лагеря';
        // Preload any models, libraries, etc, here.
    }

    public function SendEmailReg($emailto, $password)
    {
        $this->email->setFrom('ПоЛагерям', 'ByCamps');
        $this->email->setTo($emailto);
        $this->email->setSubject('Регистрация на сайте ByCamps.ru');
        $this->email->setMessage('Благодарим Вас за регистрацию. После проверки мы активируем ваш аккаунт. Ваш логин: ' .$emailto. ' Ваш пароль: '. $password .'  ');
        $this->email->send();
    }

    public function sendEmailAdmin($subject_type, $plan = null) 
    {
        $email = \Config\Services::email();
        $email->setFrom('your@example.com', 'Your Name');
        $email->setTo($this->admin_email);
        if ($subject_type == 'reg') {
            $email->setSubject($this->subject_reg);
        } elseif($subject_type == 'add_camp') {
            $email->setSubject($this->subject_add_camp);
        }
        
        $email->setMessage('Testing the email class.' . $plan);
        $email->send();
    }

    public function sendEmailBooking($emailManager) 
    {
        $email = \Config\Services::email();
        $email->setFrom('info@bycams.ru', 'Владислав');
        $email->setTo($emailManager);
        $email->setSubject('Новое бронирование на сайте ByCamps.ru');
        $email->setMessage('Наш посетитель хочет забронировать путёвку в вашем лагере. Перейдите в свой личный кабинет чтобы посмотреть контакты.');
        $email->send();
    }

    public function sendEmailPasswordReset($emails, $password) 
    {
        // $data = ['email' => $email];
        // return json_encode($data);
        $email = \Config\Services::email();
        $email->setFrom('info@bycams.ru', 'Владислав');
        $email->setTo($emails);
        $email->setSubject('Изменение пароля от личного кабинета');
        $email->setMessage('Вы запросили изменение пароля от Вашего личного кабинета. Ваш новый пароль для входа:' . $password);
        $email->send();
    }

}