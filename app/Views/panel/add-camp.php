<div class="col p-4">



<h2>Анткета лагеря</h2>
<p>Заполните поля ниже. Все данные проходят проверку. В случае указания недейтвительной информации, добавление лагеря будет отклонено.</p>

<div class="row">

<div class="col-lg-6">
<form>
  <div class="mb-3">
    <label class="form-label">Название лагеря</label>
    <input type="text" class="form-control" placeholder="Например: ДОЛ ">
  </div>
  <div class="mb-3">
  <label class="form-label">Сайт лагеря</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <div class="row">
    <label class="form-label">Возраст детей</label>
        <div class="col-lg-6">
            <select class="form-select" aria-label="Default select example">
                <option value="">от 0</option>
                <option value="">от 1</option>
                <option value="">от 2</option>
                <option value="">от 3</option>
                <option value="">от 4</option>
                <option value="">от 5</option>
                <option value="">от 6</option>
                <option value="">от 7</option>
                <option value="">от 8</option>
                <option value="">от 9</option>
                <option value="">от 10</option>
            </select>
        </div>
        <div class="col-lg-6">
            <select class="form-select" aria-label="Default select example">
                <option value="">до 1</option>
                <option value="">до 2</option>
                <option value="">до 3</option>
                <option value="">до 4</option>
                <option value="">до 5</option>
                <option value="">до 6</option>
                <option value="">до 7</option>
                <option value="">до 8</option>
                <option value="">до 9</option>
                <option value="">до 10</option>
                <option value="">до 11</option>
                <option value="">до 12</option>
                <option value="">до 13</option>
                <option value="">до 14</option>
                <option value="">до 15</option>
                <option value="">до 16</option>
                <option value="">до 17</option>
                <option value="">до 18</option>
                <option value="">до 19</option>
                <option value="">до 20</option>
            </select>
        </div>
    </div>
  </div>

</div>

<div class="col-lg-6">

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Регион</label>
    <select class="form-select" aria-label="Default select example">
    <?php 
        foreach($cities as $city) {
            echo '<option value="'.$city['cities_id'].'">'.$city['title'].'</option>';
        }
    ?>
</select>
  </div>


  
  <div class="mb-3">
  <label class="form-label">Ссылка на группу Вконтакте</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Год основания</label>
    <select class="form-select" aria-label="Default select example">
      <?php
          for ($i = 1990; $i <= date('Y'); $i++) {
              echo '<option value="">'.$i.'</option>';
          }
      ?>
            </select>
  </div>


  
  </div>



<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Описание лагеря</label>
  <textarea class="form-control textarea" id="editor" rows="13"></textarea>
</div>
<button type="submit" class="btn btn-primary">Отправить</button>
</form>



</div>
</div>



<!-- <script src="https://cdn.tiny.cloud/1/ybea7xfiykesuuu52iz9ufpmn6ntmkt9g0ox7bl7qlulmsu2/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script> -->

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/ckeditor.js"></script>

<!-- <script>
    tinymce.init({
      selector: 'textarea',
      plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
      toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
    });
  </script> -->

<script>
       ClassicEditor
    .create( document.querySelector( '#editor' ), {
        toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ],
        heading: {
            options: [
                { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' }
            ]
        }
    } )
    .catch( error => {
        console.log( error );
    } );

    </script>