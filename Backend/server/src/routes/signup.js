const express = require('express')
//const bcrypt = require('bcrypt')
const Router = express.Router()
var mysqlConnection = require('../connection/connection')

Router.post('/', function(req, res) {
  

    const {user_name,email,mobile_number,device_id,password}=req.body;
    console.log(req.body);

    mysqlConnection.query('insert into DEVICE (device_id) values(?);',
    [device_id],(error,rows,fileds)=>{

       mysqlConnection.query('insert into USER (user_name,password,email,mobile_number,device_id) values(?,?,?,?,?);',
        [user_name,password,email,mobile_number,device_id ],(error,rows,fileds)=>{

         mysqlConnection.query('insert into OWNERSHIP (device_id,user_name) values(?,?);',
            [device_id,user_name],(error,rows,fileds)=>{
                if(!error){
                    res.json({Status:'Successful'});
                }else{
                    console.log(error);
                }

    
            })
        })

    })

       

    
  })

  module.exports = Router



