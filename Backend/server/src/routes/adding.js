const express = require('express')
//const bcrypt = require('bcrypt')

const Joi =require('joi')
const Router = express.Router()
var mysqlConnection = require('../connection/connection')

Router.post('/', function(req, res) {
  

    const {user_name,email,mobile_number,device_id,password,conf_password}=req.body;
    console.log(req.body);

    //server side validation

    const schema = Joi.object({

        user_name: Joi.string().max(10).required(),
        
        device_id:Joi.string().pattern(/^[0-9]+$/).required(),
        
    });

    const result = schema.validate(req.body);

    if(result.error){

        res.status(400).send(result.error.details[0].message);
        return;
    }

    var sql = "SELECT * from USER WHERE user_name = ? ";

    mysqlConnection.query(sql,
        [user_name],(error, result) => {

            if(error){

                console.log(error);

            }

            if(!(result.length > 0)){
                res.json({Status:'Username is not registerd'});


            }else{
                var consql = "SELECT * from OWNERSHIP WHERE device_id = ? ";
                mysqlConnection.query(consql,
                    [device_id],(error, result) => {
            
                        if(error){
            
                            console.log(error);
            
                        }
            
                        if(result.length > 0){
                            res.json({Status:'Device is already added'});
            
            
                        }else{
                            mysqlConnection.query('insert into DEVICE (device_id) values(?);',
                            [device_id],(error,rows,fileds)=>{
       

                            mysqlConnection.query('insert into OWNERSHIP (device_id,user_name) values(?,?);',
                            [device_id,user_name],(error,rows,fileds)=>{
                            if(!error){
                                res.json({Status:'Successfully added the device'});
                            }else{
                                console.log(error);
                            }

    
            })
        

    })

                        }
                    });
            }
        });   
  })

  module.exports = Router




