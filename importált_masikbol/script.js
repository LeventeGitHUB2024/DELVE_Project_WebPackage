function passwordChecker(){
document.getElementById("register").onsubmit = function(event) {
    if (document.getElementById("password").value !== document.getElementById("password2").value) {
      document.getElementById("pwcheck").innerText==  
      ("Both passwords need to be the same!");
        event.preventDefault(); // Megakadályozza a form elküldését
    }
  }
};

/*document.getElementById("register").onsubmit = function(event) {
  if (document.getElementById("password").value !== document.getElementById("password2").value) {
      const alert = document.getElementsByClassName('alert alert-error');

      const newError = document.createElement('p');
      newError.textContent = "Both passwords need to be the same!";

      alert.appendChild(newError);

      event.preventDefault();
  }
};*/

/*window.onload = function() {
    if (window.innerWidth < 500 || window.innerHeight < 850) {
      alert("Az ablak túl kicsi. Kérjük, növeld a méretét!");
    }
  };*/

  function removeAlert(element) {
    element.parentNode.remove()};

