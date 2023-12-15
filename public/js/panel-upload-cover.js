
        
            const coverInput = document.querySelector('.cover-input')
            const saveBtn = document.querySelector('.save-btn')
            const coverImg = document.querySelector('.cover-img')
            const msgErrorCover = document.querySelector('.msg-error-cover')
            const camp_id_cover = document.querySelector(".camp_id");
            let slug_camp_cover = document.querySelector(".slug");
            
            msgErrorCover.style.display = 'none'
            let formData = new FormData()
            
            formData.append('camps_id', camp_id_cover.value)
            formData.append('camp_slug', slug_camp_cover.value)
            
            saveBtn.style.display = 'none'

            coverInput.addEventListener('change', () => {
                    saveBtn.style.display = 'block'
            })
            
            saveBtn.addEventListener('click', () => {
                formData.append('cover_new', coverInput.files[0])
                saveBtn.style.display = 'none'

            fetch('/panel/update-cover', {
              method: 'POST',
              body: formData
            })
            .then(res => res.json())
            .then(json => {
                console.log(json)
                if (!json.error) {
                    coverImg.setAttribute('src', `/public/images/camps/${json.src}`)
                    msgErrorCover.style.display = 'block'
                    msgErrorCover.innerHTML = json.msg
                    msgErrorCover.style.color = 'green'
                } else {
                    msgErrorCover.style.display = 'block'
                    msgErrorCover.innerHTML = json.error
                    msgErrorCover.style.color = 'red'
                }
                
            })
            .then(dd => {
                setTimeout(() => {
                    msgErrorCover.style.display = 'none'
                }, 10000);
            })
            .catch(err => console.error(err));

            })
            