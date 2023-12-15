const dopImg = document.querySelector(".dop-img");
let images = document.querySelectorAll(".images");
const camp_id = document.querySelector(".camp_id");
let slug_camp = document.querySelector(".slug");
const msgErrorImage = document.querySelector(".msg-error-image");
msgErrorImage.style.display = "none";
let formDataImage = new FormData();
let imgId;
images.forEach((img) => {
    img.addEventListener("click", (e) => {
        // Получаем id картинки по клику
        imgId = e.target.getAttribute("id");
        console.log(e.target);
        // Создаём поле загрузки файла
        const fileInput = document.createElement("input");
        fileInput.setAttribute("type", "file");
        fileInput.setAttribute("name", "image");
        fileInput.click();

        formDataImage.append("camp_slug", slug_camp.value);

        fileInput.addEventListener("change", () => {
            // console.log(fileInput.files[0])
            formDataImage.append("image", fileInput.files[0]);
            formDataImage.append("id_image", imgId);
            formDataImage.append("camp_id", camp_id.value);
            // Получаем имя картинки из src по которой кликнули
            if (e.target.src) {
                let name = e.target.src.split("/");
                formDataImage.append("old_name", name[8]);
            }

            fetch("/panel/update-images", {
                method: "POST",
                body: formDataImage,
            })
                .then((res) => {
                    return res.json();
                })
                .then((image) => {
                    if (!image.error) {
                        if (image.newImageFlag != true) {
                            e.target.setAttribute("src", `/public/images/camps/${image.src}`);
                        } else {
                            let img = document.createElement("img");
                            img.classList.add("img-fluid");
                            img.classList.add("images");
                            img.classList.add("rounded");
                            img.setAttribute("src", `/public/images/camps/${image.src}`);
                            e.target.parentElement.append(img);
                            e.target.remove();
                        }

                        msgErrorImage.style.display = "block";
                        msgErrorImage.innerHTML = image.msg;
                        msgErrorImage.style.color = "green";
                    } else {
                        msgErrorImage.style.display = "block";
                        msgErrorImage.innerHTML = image.error;
                        msgErrorImage.style.color = "red";
                    }
                });
        });
    });
});