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
async function getAlltests(){
    let testsReq = await fetch('https://localhost:44352/tests', {
        method:'GET',
        mode: 'cors',
        headers: {
            'Content-Type': 'application/json'
          },
    });

    if (testsReq.ok) { 
        let tests = await testsReq.json();
        return tests;
    } else {
        alert("Ошибка HTTP: " + testsReq.status);
    }
}
let urlParams = parseURLParams(window.location.href);
let userInfo;

async function getUser(){

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

getUser().then( (value)=>{
    userInfo = value;
});

getAlltests().then((tests)=>{
    console.log(tests);
});
async function testAccess(testName, userId){
    let access = await fetch(`https://localhost:44352/testusers/${testName}/${userId}`);

    if (access.ok) { 
        let res = await access.json();
        return res;
    } else {
        return null;
    }
}

async function getQuestions(testName){
    let access = await fetch(`https://localhost:44352/questions/${testName}`);

    if (access.ok) { 
        let res = await access.json();
        return res;
    } else {
        console.log('Failed to load questions.');
    }
}

function startTest(testName){

    testAccess(testName, userInfo.user_id).then((res)=>{
        if(res !== null){
            getQuestions(testName).then((qst)=>{

                console.log(qst);
                document.getElementById('test-bg').style.display = 'block';
                document.getElementById('test').style.display = 'block';
            });
        }else{
            alert('Вам ше не доступний цей тест.');
        }
    });
}