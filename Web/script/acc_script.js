function parseURLParams(url) {
    var queryStart = url.indexOf("?") + 1,
        queryEnd   = url.indexOf("#") + 1 || url.length + 1,
        query = url.slice(queryStart, queryEnd - 1),
        pairs = query.replace(/\+/g, " ").split("&"),
        parms = {}, i, n, v, nv;

    if (query === url || query === "") return;

    for (i = 0; i < pairs.length; i++) {
        nv = pairs[i].split("=", 2);
        n = decodeURIComponent(nv[0]);
        v = decodeURIComponent(nv[1]);

        if (!parms.hasOwnProperty(n)) parms[n] = [];
        parms[n].push(nv.length === 2 ? v : null);
    }
    return parms;
}
let urlParams = parseURLParams(window.location.href);
try{
    let mark = parseURLParams(urlParams.message[0]);
    if(mark !== undefined){
        let inx = urlParams.message[0].indexOf('?');
        urlParams.message[0] = urlParams.message[0].slice(0,inx);
    }
    alert(`Ви набрали балів за пройдений тест: ${+mark.mark}`);
}catch(e){
    console.log(e);
    console.log('first entrance');
}
let userInfo;

async function fillStat(){

    let userss = await fetch('https://6ab43dfcdc1e.ngrok.io/users');

    if (userss.ok) { 
        let users = await userss.json();
        let res = false;
        for(let user in users){
            if( (users[user]['email'] === urlParams.message[0]) ){
                res = users[user];
                break;
            }
        }
        return res;
    } else {
        alert("Ошибка HTTP: " + users.status);
    }
}
fillStat().then( (value)=>{
    userInfo = value;

    let userName = document.getElementById('userName');
    userName.textContent = value.name;
    let userLogin = document.getElementById('userLogin');
    userLogin.textContent = value.email;

    let passed_tests = document.getElementById('passed_tests');
    passed_tests.style.width = value.passed_tests;
    passed_tests.textContent = value.passed_tests + '%';

    let gained_achievements = document.getElementById('gained_achievements');
    gained_achievements.style.width = value.gained_achievements;
    gained_achievements.textContent = value.gained_achievements + '%';

    let completed_topics = document.getElementById('completed_topics');
    completed_topics.style.width = value.completed_topics;
    completed_topics.textContent = value.completed_topics + '%';

    let total_learned_phrases = document.getElementById('total_learned_phrases');
    total_learned_phrases.style.width = value.total_learned_phrases;
    total_learned_phrases.textContent = value.total_learned_phrases + '%';
    
    let finished_deadlines = document.getElementById('finished_deadlines');
    finished_deadlines.style.width = value.finished_deadlines;
    finished_deadlines.textContent = value.finished_deadlines + '%';

    getAllUserAchievements().then((userAch)=>{
        let allAchv = document.getElementById('achScroll');
        for(let i = 0; i < allAchv.length; i++){
            for(let ach in userAch){
                if(userAch[ach].name !== allAchv[i].id){
                    allAchv[i].classList.toggle('do-not-achieved');
                }
            }
        }
    });
});

function startSetting() {
    document.body.style.overflow = "hidden";
    document.getElementsByClassName('settings-bg')[0].style.display = 'block';
    document.getElementsByClassName('settings')[0].style.display = 'block';

    let newName = document.getElementById('newName');
    let newEm = document.getElementById('newEmail');
    let newPass = document.getElementById('newPass');

    newName.value = userInfo.name;
    newEm.value = userInfo.email;
    newPass.value = userInfo.password;
}

function closeSettings(){
    document.body.style.overflow = "";
    document.getElementsByClassName('settings-bg')[0].style.display = 'none';
    document.getElementsByClassName('settings')[0].style.display = 'none';
}

async function acceptChanges(id, newName, newEm, newPass){
    let data = {
        User_id: id,
        Name: newName, 
        Email: newEm, 
        Password: newPass,
    };
    return await fetch('https://6ab43dfcdc1e.ngrok.io/users/'+id, {
        method: 'PUT', 
        mode: 'cors', 
        cache: 'no-cache', 
        credentials: 'same-origin', 
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data) 
      });  
}

function processChanges(){
    let newName = document.getElementById('newName');
    let newEm = document.getElementById('newEmail');
    let newPass = document.getElementById('newPass');
    
    newName.addEventListener('input', function(){
        if( newName.classList.contains('invalid') ){
          newName.classList.toggle('invalid');
        }
      });
    newEm.addEventListener('input', function(){
        if( newEm.classList.contains('invalid') ){
          newEm.classList.toggle('invalid');
        }
      });
      newPass.addEventListener('input', function(){
        if( newPass.classList.contains('invalid') ){
          newPass.classList.toggle('invalid');
        }
      });

      const regExlog = /([\w])*[@]\w+/g;
      const regExPass = /.{6,30}/;
    
      if( !regExlog.test(newEm.value) ){
        newEm.classList.toggle('invalid');
        let p = document.createElement('p');
        p.textContent = 'Невірно задана пошта!';
        p.style.fontSize = '16px';
        p.style.margin = '0';
        newEm.after(p);
    
        if( !regExPass.test(newPass.value) ){
          newPass.classList.toggle('invalid');
          let p = document.createElement('p');
          p.textContent = 'Пароль має більше символів!';
          p.style.fontSize = '16px';
          p.style.margin = '0';
          newPass.after(p);
        }
        return;
      }
      if(newName.value === '' || newName.value === ' '){
        newName.classList.toggle('invalid');
        let p = document.createElement('p');
        p.textContent = 'Ім\'я не може бути пустим!';
        p.style.fontSize = '16px';
        p.style.margin = '0';
        newName.after(p);
        return;
      }
      if( !regExPass.test(newPass.value) ){
        newPass.classList.toggle('invalid');
        let p = document.createElement('p');
        p.textContent = 'Пароль має більше символів!';
        p.style.fontSize = '16px';
        p.style.margin = '0';
        newPass.after(p);
        return;
      }
      acceptChanges(userInfo.user_id, newName.value, newEm.value, newPass.value).then( ()=>{
          let newEmail = document.getElementById('newEmail').value;
          window.location.href = 'account.html?message='+newEmail;
          closeSettings();
      });
}

async function deleteUser(){
    return await fetch('https://6ab43dfcdc1e.ngrok.io/users/'+urlParams.message[0], {
    method: 'DELETE', 
    mode: 'cors', 
    });
}
function confirmDelete(){
    if( confirm('Підтвердіть видалення аккаунту.\nВидаленний аккаунт не підлягає відновленню!') ){
        deleteUser().then(()=>{window.location = 'index.html'});
    }
}

async function getAllAchievements(){
    let achievements1 = await fetch('https://6ab43dfcdc1e.ngrok.io/achievements');

    if (achievements1.ok) { 
        let achievements = await achievements1.json();
        return achievements;
    } else {
        alert("Ошибка HTTP: " + achievements1.status);
    }
}
getAllAchievements().then((achv)=>{
    let scrollAchv = document.getElementById('achScroll');
    for(ach in achv){
        let div = document.createElement('div');
        div.setAttribute('id', achv[ach].name);
        div.classList.add('do-not-achieved', 'me-3');
        let h2 = document.createElement('h2');
        h2.textContent = achv[ach].name;
        let p2 = document.createElement('p');
        p2.textContent = achv[ach].description;
        div.appendChild(h2);
        div.appendChild(p2);
        scrollAchv.appendChild(div);
    }
});

async function getAllUserAchievements(){
    let achievementsReq = await fetch('https://6ab43dfcdc1e.ngrok.io/achievements/getAchievement/'+userInfo.user_id);

    if (achievementsReq.ok) { 
        let achievements = await achievementsReq.json();
        return achievements;
    } else {
        alert("Ошибка HTTP: " + achievementsReq.status);
    }
}

function goToTest(){
    window.location.href = 'test.html?message='+userInfo.email;
}