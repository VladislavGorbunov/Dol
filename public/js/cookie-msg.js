const cookieBlock = document.querySelector('.cookie-block')
    const cookieBtn = document.querySelector('.cookie-btn')

    cookieBtn.addEventListener('click', () => {
      document.cookie = "cookieMsg=true;path=/;max-age=31556926";
      cookieBlock.style.display = 'none'
    })

    let cookie = document.cookie.match(/cookieMsg=(.+?)(;|$)/)
    console.log(cookie)

    if (cookie) {
      cookieBlock.style.display = 'none'
    } else {
      cookieBlock.style.display = 'block'
    }
