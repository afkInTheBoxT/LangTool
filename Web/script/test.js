function parseURLParams(url) {
    var queryStart = url.indexOf("?") + 1,
        queryEnd = url.indexOf("#") + 1 || url.length + 1,
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
async function getAlltests() {
    let testsReq = await fetch('http://656e444d50ad.ngrok.io/tests', {
        method: 'GET',
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

async function getUser() {

    let userss = await fetch('http://656e444d50ad.ngrok.io/users');

    if (userss.ok) {
        let users = await userss.json();
        let res = false;
        for (let user in users) {
            if ((users[user]['email'] === urlParams.message[0])) {
                res = users[user];
                break;
            }
        }
        return res;
    } else {
        alert("Ошибка HTTP: " + users.status);
    }
}

getUser().then((value) => {
    userInfo = value;
});

getAlltests().then((tests) => { });

async function testAccess(testName, userId) {
    let res = false;
    let access = await fetch(`http://656e444d50ad.ngrok.io/testusers/${testName}/${userId}`);
    if (access.ok) {
        let res = await access.json();
        return res;
    } else {
        console.log('Failed to load questions.');
    }
}

async function getQuestions(testId) {
    let access = await fetch(`http://656e444d50ad.ngrok.io/questions/${testId}`);

    if (access.ok) {
        let res = await access.json();
        return res;
    } else {
        console.log('Failed to load questions.');
    }
}

async function getAnswers(qstId) {
    let access = await fetch(`http://656e444d50ad.ngrok.io/questions/answers/${qstId}`);

    if (access.ok) {
        let res = await access.json();
        return res;
    } else {
        console.log('Failed to load questions.');
    }
}

async function postAnswers(testName, userId, answers) {
    answers[0] = answers[0] === undefined ? null : answers[0];
    answers[1] = answers[1] === undefined ? null : answers[1];
    answers[2] = answers[2] === undefined ? null : answers[2];
    answers[3] = answers[3] === undefined ? null : answers[3];
    let postRes = `["${answers[0]}","${answers[1]}","${answers[2]}","${answers[3]}"]`;
    let mes;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", `http://656e444d50ad.ngrok.io/tests/checkTest/${testName}/${userId}`, true);

    //Передаёт правильный заголовок в запросе
    xhr.setRequestHeader("Content-type", "application/json");

    xhr.onreadystatechange = function() {
        if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
            window.location = 'account.html?message=' +userInfo.email +'?mark='+JSON.parse(xhr.response).currentMark;
        }
    }
    
    xhr.send(postRes);
}


function startTest(testName) {

    let pSpans = document.getElementById('questionNumber').children;
    let h3 = document.getElementById('question');
    let labeles = document.getElementsByClassName('ansLables');
    let nextBut = document.getElementById('nextBut');
    let closeBut = document.getElementById('closeBut');
    let answ = [];

    testAccess(testName, userInfo.user_id).then((res) => {
        if (res) {
            getQuestions(testName).then((qst) => {
                pSpans[1].textContent = qst.length;

                function selfCall(i) {
                    getAnswers(qst[i].question_id).then((ansW) => {
                        pSpans[0].textContent = i + 1;
                        h3.textContent = qst[i].questionName;
                        for (let j = 0; j < 4; j++) {
                            labeles[j].textContent = ansW[j].correctAnswer;
                        }
                    });
                };
                selfCall(0);

                nextBut.addEventListener('click', function () {
                    if (nextBut.classList.contains('0')) {
                        nextBut.classList.remove('0');
                        nextBut.classList.add('1');
                        for(let radio of labeles){
                            if(radio.checked){
                                answ[0] = radio.textContent;
                            }
                        }
                        selfCall(1);
                    } else if (nextBut.classList.contains('1')) {
                        nextBut.classList.remove('1');
                        nextBut.classList.add('2');
                        for(let radio of labeles){
                            if(radio.checked){
                                answ[1] = radio.textContent;
                            }
                        }
                        selfCall(2);
                    } else if (nextBut.classList.contains('2')) {
                        nextBut.classList.remove('2');
                        nextBut.classList.add('3');
                        for(let radio of labeles){
                            if(radio.checked){
                                answ[2] = radio.textContent;
                            }
                        }
                        selfCall(3);
                        nextBut.style.visibility = 'hidden';
                    }
                    selfCall(0);
                });

                closeBut.addEventListener('click', function () {
                    for(let radio of labeles){
                        if(radio.checked){
                            answ[3] = radio.textContent;
                        }
                    }
                    postAnswers(testName, userInfo.user_id, answ);
                });

                document.getElementById('test-bg').style.display = 'block';
                document.getElementById('test').style.display = 'block';
            });
        } else {
            alert('Вам ше не доступний цей тест.');
        }
    });
}
