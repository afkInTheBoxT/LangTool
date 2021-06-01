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

async function fillStat(){
    let urlParams = parseURLParams(window.location.href);

    let userss = await fetch('https://localhost:44352/users');

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

    let alphabet_progress = document.getElementById('alphabet_progress');
    alphabet_progress.style.width = value.alphabet_progress;
    alphabet_progress.textContent = value.alphabet_progress + '%';
    
    let finished_deadlines = document.getElementById('finished_deadlines');
    finished_deadlines.style.width = value.finished_deadlines;
    finished_deadlines.textContent = value.finished_deadlines + '%';
} );