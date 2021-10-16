const express = require('express');

//initialize the app
const app = express();

//settings
app.set('port',process.env.PORT || 8000);

//middleware
app.use(express.json());

//routes

const signuproute = require('./src/routes/signup')
const loginroute = require('./src/routes/login')
const userroute =  require('./src/routes/user')
const ownerroute =  require('./src/routes/ownership')
const deviceroute =  require('./src/routes/device')

app.use('/signups',signuproute);
app.use('/logins',loginroute);
app.use('/users',userroute);
app.use('/owners',ownerroute);
app.use('/devices',deviceroute);

//startung the server
app.listen(app.get('port'),()=>{
    console.log('serevr on port',app.get('port'));
});