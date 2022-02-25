/**
 * @author David Rosas
 */

{

    const init = function() {
        let h4 = document.querySelector("body > main > section > article.skills > div.formacion > div.estudios > div.no_oficiales > h4");
        h4.addEventListener("click", accion);
    }

    const accion = function(element) {
        this.style.display = "none";
        let div = document.getElementById("certificados");
        div.style.display = "block";
    }

    document.addEventListener("DOMContentLoaded", init);
}