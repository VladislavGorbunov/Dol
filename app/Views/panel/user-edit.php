<style>
    .save {
        cursor: pointer;
        text-align: center;
        background: #385bd7;
        border-radius: 5px;
        color: #fff;
        padding: 10px;
    }

    .loading {
        text-align: center;
        border: 1px solid #385bd7;
        border-radius: 5px;
        color: #385bd7;
        padding: 10px;
    }

    .form-control {
        padding: 10px;
    }
    
</style>

<form action="" method="post" class="userForm">
<div class="row">
    <h3>Данные представителя лагеря</h3>
        <div class="alert alert-success mt-3">Изменения сохранены.</div>
        <div class="alert alert-danger mt-3">Произошла ошибка при сохранении данных.</div>

        <div class="col">
            <input type="text" class="form-control" name="user_id" value="<?= $user['user_id'] ?>" hidden>

            <label class="form-label mt-3">Организация</label>
            <input type="text" class="form-control" name="organization" value="<?= $user['organization'] ?>">

            <label class="form-label mt-3">ИНН</label>
            <input type="text" class="form-control" name="inn" value="<?= $user['inn'] ?>">

            <label class="form-label mt-3">Директор</label>
            <input type="text" class="form-control" name="director" value="<?= $user['director'] ?>">

            <label class="form-label mt-3">Телефон директора</label>
            <input type="text" class="form-control" name="director_phone" value="<?= $user['director_phone'] ?>">

            <div class="mt-5">
                <a href="">Изменить пароль от личного кабинета</a>
            </div>
        </div>


        <div class="col">
            <label class="form-label mt-3">Ваша должность</label>
            <input type="text" class="form-control" name="post" value="<?= $user['post'] ?>">

            <label class="form-label mt-3">Телефон для связи</label>
            <input type="text" class="form-control" name="phone_manager" value="<?= $user['phone_manager'] ?>">

            <label class="form-label mt-3">Ваше имя</label>
            <input type="text" class="form-control" name="firstname_manager" value="<?= $user['firstname_manager'] ?>">

            <label class="form-label mt-3">Фамилия</label>
            <input type="text" class="form-control" name="lastname_manager" value="<?= $user['lastname_manager'] ?>">

            <label class="form-label mt-3">Email</label>
            <input type="text" class="form-control" name="email_manager" value="<?= $user['email_manager'] ?>">

            <div class="save col-6 mt-5"><i class="las la-save"></i> Сохранить изменения</div>
            <div class="loading col-6 mt-5">
            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Обновляем данные
            </div>
        </div>
    
</div>
</form>

<script>
    const userForm = document.querySelector('.userForm')
    const alertSuccess = document.querySelector('.alert-success')
    const alertDanger = document.querySelector('.alert-danger')
    const saveBtn = document.querySelector('.save')
    const loading = document.querySelector('.loading')
    const formControl = document.querySelectorAll('.form-control')

    loading.style.display = 'none'
    alertSuccess.style.display = 'none'
    alertDanger.style.display = 'none'

    const btnSave = document.querySelector('.save')
    let formData

    formControl.forEach(input => {
        input.addEventListener('input', (e) => {
            if (e.target.value.length < 3) {
                e.target.style.color = 'red'
                e.target.style.borderColor = 'red'
                saveBtn.style.display = 'none'
            } else {
                saveBtn.style.display = 'block'
                e.target.style.color = ''
                e.target.style.borderColor = ''
            }
            console.log(e.target)
        })
    })


    btnSave.addEventListener('click', () => {
        formData = new FormData(userForm)
        saveBtn.style.display = 'none'
        loading.style.display = 'block' 
        userEdit()
        
    })

    async function userEdit() {
        let response = await fetch('/panel/user-edit', {method: 'POST', body: formData})
        let data = await response.json()
            
        if (data.success == true) {
            alertSuccess.style.display = 'block'
        } else {
            alertDanger.style.display = 'block'
        }
            
        saveBtn.style.display = 'block'
        loading.style.display = 'none'

        setTimeout(() => {
            alertSuccess.style.display = 'none'
        }, 5000)
    }

</script>