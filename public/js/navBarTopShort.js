const navBarTop = document.querySelector('.navbar')
            const headerBlock = document.querySelector('.header-image-short')
            console.log(navBarTop)
            window.addEventListener('scroll', function() {
                if (pageYOffset > 300) {
                    navBarTop.classList.add("fixed-top");
                    navBarTop.style.background = "rgba(255,255,255,0.87)"
                    navBarTop.style.boxShadow = "0px 2px 15px -10px rgba(0,0,0,0.2)"
                    navBarTop.style.paddingTop = 0 + 'px'
                    headerBlock.style.marginTop = 90 + 'px'
                    navBarTop.classList.remove('py-3')
                    navBarTop.classList.add('py-2')
                } else {
                    navBarTop.classList.remove("fixed-top")
                    navBarTop.style.background = "rgba(255,255,255,1)"
                    headerBlock.style.marginTop = 0 + 'px'
                    navBarTop.classList.remove('py-2')
                    navBarTop.classList.add('py-3')
                }
            });