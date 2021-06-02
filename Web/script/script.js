function disableScroll() {
  document.body.style.overflow = "hidden";
}
function enableScroll() {
  document.body.style.overflow = "";
}
function startAuthorization(){
    document.getElementsByClassName("sign-in-absolute-block-content")[0].style.display = "block";
    document.getElementsByClassName("sign-in-absolute-block")[0].style.display = "block";
    disableScroll();
}
function closeAuthorization(){
    document.getElementsByClassName("sign-in-absolute-block-content")[0].style.display = "none";
    document.getElementsByClassName("sign-in-absolute-block")[0].style.display = "none";
    document.getElementsByClassName("registration")[0].style.display = "none";
    enableScroll();
}

function registration(){
  document.getElementsByClassName("sign-in-absolute-block-content")[0].style.display = "none";
  document.getElementsByClassName("registration")[0].style.display = "block";
}

function regUser(){
  const email = document.getElementById('emailReg');
  const passwords = document.getElementsByName('passwordReg');

  email.addEventListener('input', function(){
    if( email.classList.contains('invalid') ){
      email.classList.toggle('invalid');
    }
  });
  passwords[0].addEventListener('input', function(){
    if( passwords[0].classList.contains('invalid') ){
      passwords[0].classList.toggle('invalid');
    }
  });
  passwords[1].addEventListener('input', function(){
    if( passwords[1].classList.contains('invalid') ){
      passwords[1].classList.toggle('invalid');
    }
  });

  const regExlog = /([\w])*[@]\w+/g;
  const regExPass = /.{6,30}/;

  if( !regExlog.test(email.value) ){
    email.classList.toggle('invalid');

    let p = document.createElement('p');
    p.textContent = 'Невірно задана пошта!';
    p.style.fontSize = '16px';
    p.style.margin = '0';

    email.after(p);

    if( !regExPass.test(passwords[0].value) ){
      passwords[0].classList.toggle('invalid');

      let p = document.createElement('p');
      p.textContent = 'Пароль має більше символів!';
      p.style.fontSize = '16px';
      p.style.margin = '0';
      
      passwords[0].after(p);
    }
    if( passwords[0].value === passwords[1].value ){
      passwords[1].classList.toggle('invalid');

      let p = document.createElement('p');
      p.textContent = 'Паролі повинні співпадати!';
      p.style.fontSize = '16px';
      p.style.margin = '0';
      
      passwords[1].after(p);
    }
    return;
  }

  if( !regExPass.test(passwords[0].value) ){
    passwords[0].classList.toggle('invalid');

    let p = document.createElement('p');
    p.textContent = 'Пароль має більше символів!';
    p.style.fontSize = '16px';
    p.style.margin = '0';

    passwords[0].after(p);
    return;
  }

  if( passwords[0].value !== passwords[1].value ){
    passwords[1].classList.toggle('invalid');

    let p = document.createElement('p');
    p.textContent = 'Паролі повинні співпадати!';
    p.style.fontSize = '16px';
    p.style.margin = '0';
    
    passwords[1].after(p);
    return;
  }

  createUser().then( (value)=> {console.log(value)} );
}


function entrance(message){
  window.location = 'account.html?message='+message;
}
// fix infinity p's
function validate(){
  const login = document.getElementById('login');
  const password = document.getElementById('password');
  login.addEventListener('input', function(){
    if( login.classList.contains('invalid') ){
      login.classList.toggle('invalid');
    }
  });
  password.addEventListener('input', function(){
    if( password.classList.contains('invalid') ){
      password.classList.toggle('invalid');
    }
  });

  const regExlog = /([\w])*[@]\w+/g;
  const regExPass = /.{6,30}/;

  if( !regExlog.test(login.value) ){
    login.classList.toggle('invalid');
    let p = document.createElement('p');
    p.textContent = 'Невірно задана пошта!';
    p.style.fontSize = '16px';
    p.style.margin = '0';
    login.after(p);

    if( !regExPass.test(password.value) ){
      password.classList.toggle('invalid');
      let p = document.createElement('p');
      p.textContent = 'Пароль має більше символів!';
      p.style.fontSize = '16px';
      p.style.margin = '0';
      password.after(p);
    }
    return;
  }
  if( !regExPass.test(password.value) ){
    password.classList.toggle('invalid');
    let p = document.createElement('p');
    p.textContent = 'Пароль має більше символів!';
    p.style.fontSize = '16px';
    p.style.margin = '0';
    password.after(p);
    return;
  }

  faceControl(login.value, password.value).then( (value) => { 
    if(value){
    entrance( value ) 
    }
  });

}

// Отслеживание пользователя
const observer = new IntersectionObserver(entries => {
    // Loop over the entries
    entries.forEach(entry => {
      // If the element is visible
      if (entry.isIntersecting) {
        // Add the animation class
        setTimeout(() => {
          entry.target.classList.remove('turnoff-visibility');
          entry.target.classList.add('fade-in-text')}, 300);
      }
    });
  }); 
observer.observe(document.getElementsByClassName('basic-info__text-line')[0]);

//fade in classes add
const observerForFadeIn = new IntersectionObserver(entries => {
  // Loop over the entries
  entries.forEach(entry => {
    // If the element is visible
    if (entry.isIntersecting) {
      // Add the animation class
      entry.target.classList.remove('turnoff-visibility');
      entry.target.classList.add('animate__animated', 'animate__fadeInRight', 
      'animate__slow');
    }
  });
});
const observerForFadeInLeft = new IntersectionObserver(entries => {
  // Loop over the entries
  entries.forEach(entry => {
    // If the element is visible
    if (entry.isIntersecting) {
      // Add the animation class
      entry.target.classList.remove('turnoff-visibility');
      entry.target.classList.add('animate__animated', 'animate__fadeInLeft', 
      'animate__slow');
    }
  });
});
observerForFadeIn.observe(document.getElementsByClassName('fade-in-right')[0]);
observerForFadeIn.observe(document.getElementsByClassName('fade-in-right')[1]);
observerForFadeInLeft.observe(document.getElementsByClassName('fade-in-left')[0]);
observerForFadeInLeft.observe(document.getElementsByClassName('fade-in-left')[1]);