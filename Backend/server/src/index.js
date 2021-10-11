const express = require('express');
const app = express();

//settings
app.set('port',process.env.PORT || 8000);

//middleware
app.use(express.json());

//routes
//app.use(require('./routes/user'));
app.use(require('./routes/device'));
//app.use(require('./routes/addDevice'));

//startung the server
app.listen(app.get('port'),()=>{
    console.log('serevr on port',app.get('port'));
});