const express = require('express');
const app = express();

//settings
app.set('port',process.env.PORT || 8000);

//middleware
app.use(express.json());

//routes
//app.use(require('./test/user'));
app.use(require('./test/device'));
//app.use(require('./test/addDevice'));

//startung the server
app.listen(app.get('port'),()=>{
    console.log('serevr on port',app.get('port'));
});