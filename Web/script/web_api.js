async function faceControl(login, password){
    let userss = await fetch('http://656e444d50ad.ngrok.io/users');

    if (userss.ok) { // если HTTP-статус в диапазоне 200-299
    // получаем тело ответа (см. про этот метод ниже)
    let users = await userss.json();
    let res = false;
    for(let user in users){
        if( (users[user]['email'] === login) && (users[user]['password'] === password) ){
            res = users[user]['email'];
            break;
        }
    }
    return res;
    } else {
        alert("Ошибка HTTP: " + users.status);
    }
}

async function createUser(){
    let curDate = new Date();
    /*let curDateString = `${curDate.getFullYear()}-${curDate.getMonth()}-${curDate.getDate()}T${curDate.getHours()}:${curDate.getMinutes()}:${curDate.getSeconds()}`;
    //data = '['+JSON.stringify(data)+']'; registrationDate: curDateString*/

    let data = {
        Name: document.getElementById('user-name').value, 
        Email: document.getElementById('emailReg').value, 
        Password: document.getElementById('passReg').value,
    };
    
    const response = await fetch('http://656e444d50ad.ngrok.io/users', {
        method: 'POST', 
        mode: 'cors', 
        cache: 'no-cache', 
        credentials: 'same-origin', 
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data) 
      });
      return await response.json();
}