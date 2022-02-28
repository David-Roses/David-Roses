/**
 * @author David Rosas
 */

{

    const init = function() {
        let h4 = document.querySelector("body > main > section > article.skills > div.formacion > div.estudios > div.no_oficiales > h4");
        h4.addEventListener("click", accion);

        let elements = document.querySelectorAll("body > header.cabecera > nav > ul > li > a");
        elements.forEach(element => {
            element.addEventListener("click", function() {
                let menuppal = document.querySelector("body > header.cabecera > nav");
                let hamburguer = document.querySelector("body > header.cabecera > div");
                menuppal.classList.remove("is_active");
                hamburguer.classList.remove("is-active");
            });
        });
    }

    const accion = function(element) {
        this.style.display = "none";
        let div = document.getElementById("certificados");
        div.style.display = "block";
    }

    document.addEventListener("DOMContentLoaded", init);
}