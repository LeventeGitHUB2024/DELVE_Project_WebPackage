/*function passwordChecker(){
document.getElementById("register").onsubmit = function(event) {
    if (document.getElementById("password").value !== document.getElementById("password2").value) {
      document.getElementById("pwcheck").innerText = 
      "Both passwords need to be the same!";
        event.preventDefault(); // Megakadályozza a form elküldését
    }
  }
};
*/
/*function passwordChecker() {
  document.getElementById("register").onsubmit = function(event) {
      const password1 = document.getElementById("password").value;
      const password2 = document.getElementById("password2").value;

      if (password1 !== password2) {
          document.getElementById("pwcheck").innerText = 
          "Both passwords need to be the same!";
          event.preventDefault(); // Megakadályozza a form elküldését
      } else {
          document.getElementById("pwcheck").innerText = ""; // Törli a hibaüzenetet, ha egyeznek
      }
  }
}

passwordChecker();*/

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


document.getElementById('password1check').addEventListener('change',function(){
  var pw1 = document.getElementById('password');

  // Ha be van pipálva, változtasd meg a jelszó mező típusát 'text'-re
  if (this.checked){
    pw1.type = 'password';
  } else{
    pw1.type = 'text'
  }
});