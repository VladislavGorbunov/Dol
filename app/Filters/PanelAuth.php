<?php 
namespace App\Filters;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\Filters\FilterInterface;

class PanelAuth implements FilterInterface
{
    public $RepresentativesModel;

    public function before(RequestInterface $request, $arguments = null)
    {
        
        if (!session()->get('isLoggedIn')) {
            return redirect()->to('/login');
        }
    }
    
    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Создаём рандомный хэш-токен
        // пишем его в бд
        // пишем его в куки
       
        //echo $cookie->getName(); 
        //echo $cookie->getValue(); 
        
    }
}