{


    // selector
    var menu = document.querySelector('.hamburger');

    // method
    function toggleMenu(event) {
        this.classList.toggle('is-active');
        document.querySelector(".menuppal").classList.toggle("is_active");
        event.preventDefault();
    }

    // event
    menu.addEventListener('click', toggleMenu, false);


    var nota = document.getElementById('add');
    var nota2 = document.getElementById('btnNota');
    var btnExit = document.getElementById("btnCancel");


    function toggleNota(event) {
        document.querySelector(".modal").classList.toggle("is_active");
        event.preventDefault();
    }

    function toggleNota2(event) {
        document.querySelector(".modal").classList.toggle("is_active");
        event.preventDefault();
    }

    function toggleNota3(event) {
        document.querySelector(".modal").classList.toggle("is_active");
        event.preventDefault();
    }

    nota.addEventListener('click', toggleNota, false);
    nota2.addEventListener('click', toggleNota2, false);
    btnExit.addEventListener('click', toggleNota3, true);

    var menuSalir = document.getElementById('ruletaSalir');
    var menuSalir2 = document.getElementById('cerrarSalir');

    function toggleMenuSalir(event) {
        document.querySelector(".menuSalir").classList.toggle("is_active");
        event.preventDefault();
    }
    
    function toggleMenuSalir2(event) {
        document.querySelector(".menuSalir").classList.toggle("is_active");
        event.preventDefault();
    }

    menuSalir.addEventListener('click', toggleMenuSalir, false);
    menuSalir2.addEventListener('click', toggleMenuSalir2, true);

}