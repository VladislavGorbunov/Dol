<?php

namespace App\Controllers;

class RecaptchaController extends BaseController
{

    public $api_url = 'https://hcaptcha.com/siteverify';
    public $secret_key = '0x27ad7d2c95996992Ea55Fce1229d607EEb513527';

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        // Preload any models, libraries, etc, here.
    }

    
    public function RecaptchaCheck($recaptcha_response)
    {

        $array = [
            'secret' => $this->secret_key,
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
         
        return $responseData->success;
    }

}