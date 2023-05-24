<!-- содержимое -->
<div class="col p-5">

    <?php

var_dump($info);
var_dump($city);
?>

    <form action="" method="post"> 

        <div class="row">
        <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">ID</label>
                    <input type="text" class="form-control" name="user_id" value="<?= $info[0]['user_id'] ?>" readonly>
                </div>

            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Город</label>
                    <input type="text" class="form-control" value="<?= $city[0]['title'] ?>" readonly>
                </div>
                <div class="mb-3">
                    
                    <input type="text" class="form-control" value="<?= $city[0]['cities_id'] ?>" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Директор</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<?= $info[0]['director'] ?>">
                </div>
                
            </div>

            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Организация</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" value="<?= $info[0]['organization'] ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Директор</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
            
            </div>

            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">ИНН</label>
                    <input type="text" class="form-control" name="inn" value="<?= $info[0]['inn'] ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
                
            </div>


            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Директор</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
                
            </div>

            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
                
            </div>

            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
                
            </div>


        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>





</div>