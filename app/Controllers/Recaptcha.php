<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Camps;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;
use App\Models\Images;

class Recaptcha extends BaseController
{

    public $api_url = 'https://hcaptcha.com/siteverify';

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->Camps = new Camps();
        $this->Cities = new Cities();
        $this->Types = new Types();
        $this->Seasons = new Seasons();
        $this->Images = new Images();
        // Preload any models, libraries, etc, here.
    }

    
    public function RecaptchaCheck($recaptcha_response)
    {

        $array = [
            'secret' => '0x27ad7d2c95996992Ea55Fce1229d607EEb513527',
            'response'    => $recaptcha_response,
        ];		
         
        $ch = curl_init($this->api_url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($array));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HEADER, false);

        $verifyResponse = curl_exec($ch);
        $responseData = json_decode($verifyResponse);
        
        curl_close($ch);	
         
        if ($responseData->success) {
            echo 'captcha ok';
        } else {
            echo 'captcha error';
        }
        
        die;
    }

}