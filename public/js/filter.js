const region_msg = document.getElementById("region_msg");
let region = document.getElementById("region");
let season = document.getElementById("season");
let type = document.getElementById("type");
let age = document.getElementById("age");

const search_btn = document.getElementById("search");

addEventListener("change", () => {
    url = '/camps';

    if (region.value) {
        url += '/' + region.value;
        region_msg.innerHTML = '';
        region.style.border = 'none';
    } else {
        url += '/russia';
    }

    if (type.value) {
        url += '/' + type.value;
        document.title += type.selectedOptions[0].text;
    } else {
        url += '/type-all';
    }

    if (season.value) {
        url += '/' + season.value;
    } else {
        url += '/season-all';
    }

    if (age.value) {
        url += '/' + age.value;
        document.title += age.selectedOptions[0].text;
    } else {
        url += '';
    }

    console.log(url);

});



search_btn.addEventListener('click', () => {
    if (!region.value) {
        region_msg.innerHTML = 'Выберите регион поиска';
        region.style.border = '1px solid #ff4444';
    } else {
        window.location.href = url;
    }

});