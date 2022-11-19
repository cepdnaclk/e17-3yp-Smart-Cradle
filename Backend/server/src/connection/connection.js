const mysql = require('mysql');

const mysqlConnection=mysql.createConnection({

    host:'smartcradle.cmxw8nidv6uj.ap-northeast-1.rds.amazonaws.com',
    user:'admin',
    password:'madUSH1998',
    database:'cradle',

});

mysqlConnection.connect(function(error){
    if(error){
        console.log(error);
    }else{

        console.log('Connected to the databse : cradle');

    }
});

module.exports = mysqlConnection;

