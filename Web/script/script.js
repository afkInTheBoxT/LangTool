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
    enableScroll();
}
function entrance(){
  window.location.href = 'account.html';
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