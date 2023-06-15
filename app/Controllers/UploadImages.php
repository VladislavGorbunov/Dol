<?php

namespace App\Controllers;

use CodeIgniter\Files\File;

class UploadImages extends BaseController
{

    public function upload()
    {
        $validationRule = [
            'userfile' => [
                'label' => 'Image File',
                'rules' => [
                    'uploaded[images]',
                    'is_image[images]',
                    'mime_in[images,image/jpg,image/jpeg,image/gif,image/png,image/webp]',
                    'max_size[images,100]',
                    'max_dims[images,1024,768]',
                ],
            ],
        ];
        if (! $this->validate($validationRule)) {
            $data = ['errors' => $this->validator->getErrors()];

            return view('upload_form', $data);
        }

        $img = $this->request->getFile('images');

        if (! $img->hasMoved()) {
            $filepath = WRITEPATH . 'uploads/' . $img->store();

            $data = ['uploaded_fileinfo' => new File($filepath)];

            return view('upload_success', $data);
        }

        $data = ['errors' => 'The file has already been moved.'];

        return view('upload_form', $data);
    }
}