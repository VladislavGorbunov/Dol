<form action="/panel/add-shift" method="POST">
<div class="row">
<div class="col-lg-6">
    <label class="form-label mt-2">Название смены</label>
    <input type="text" class="form-control" name="title-shift" required>

    <label class="form-label mt-2">Стоимость путёвки (руб.)</label>
    <input type="text" class="form-control" name="price-shift" required>
 
</div>

<div class="col-lg-6">
    <div class="row">
        <div class="col-lg-6">
            <label for="date" class="col-12 col-form-label mt-2">Дата начала смены</label>
            <input type="date" name="start-date" required>  
        </div>

        <div class="col-lg-6">
            <label for="date" class="col-12 col-form-label mt-2">Дата конца смены</label>
            <input type="date" name="end-date" required>  
        </div>
    </div>
</div>

<div class="col-lg-12">
<button type="submit" class="btn btn-primary mt-3 col-lg-3">Добавить смену</button>
</div>
</div>
</form>



