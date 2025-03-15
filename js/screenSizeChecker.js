function checkResolution() {
    const width = window.innerWidth;
    const height = window.innerHeight;

    const message = document.getElementById('message');
    const wrapper = document.querySelector('.wrapper');


            if (width < 550 || height < 500) {
               message.style.display = 'block';
               wrapper.classList.add('hide');
            }else{
                message.style.display = 'none';
                wrapper.classList.remove('hide')
            }
        }

    window.onload = checkResolution;
    window.onresize = checkResolution;