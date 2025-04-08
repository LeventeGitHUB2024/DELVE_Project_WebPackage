  function removeAlert(element) {
    element.parentNode.remove()};


document.getElementById('password1check').addEventListener('change',function(){
  var pw1 = document.getElementById('password');

  if (this.checked){
    pw1.type = 'password';
  } else{
    pw1.type = 'text'
  }
});

document.getElementById('password2check').addEventListener('change',function(){
  var pw2 = document.getElementById('password2');

  if (this.checked){
    pw2.type = 'password';
  } else{
    pw2.type = 'text'
  }
});