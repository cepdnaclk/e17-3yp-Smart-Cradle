const express = require('express')
const bcrypt = require('bcrypt')

const Joi =require('joi')
const Router = express.Router()
var mysqlConnection = require('../connection/connection')

Router.post('/', async function(req, res, next) {
  
    const {user_name,email,mobile_number,device_id,password,conf_password}=req.body;
    console.log(req.body);
    //server side validation

    const schema = Joi.object({

        user_name: Joi.string().min(5).max(15).required(),
        email: Joi.string().email().max(50).required(),
        mobile_number:Joi.string().pattern(/^[0-9]+$/).min(10).max(10).required(),
        device_id:Joi.string().pattern(/^[0-9]+$/).required(),
        password:Joi.string().min(6).max(15).required(),
        conf_password:Joi.any().valid(Joi.ref('password')).required()
    });


    const result = schema.validate(req.body);

    if(result.error){

        res.status(400).send(result.error.details[0].message);
        return;
    }
    if(req.body.password!=undefined){
      try{
        await bcrypt.hash(req.body.password, 10, function(err, hash) {
          if (err) {
          return next(err);
          }
          var hashedPassword = hash
          
          
    var sql = "SELECT * from USER WHERE user_name = ? ";

    mysqlConnection.query(sql,
        [user_name],(error, result) => {

            if(error){

                console.log(error);

            }

            if(result.length > 0){
                return res.status(401).json({               //already exist user_name
                    success: 0,
                    message:'Already exsist user name',
                    //token: token
                })


            }else{
                var consql = "SELECT * from OWNERSHIP WHERE device_id = ? ";
                mysqlConnection.query(consql,
                    [device_id],(error, result) => {
            
                        if(error){
            
                            console.log(error);
            
                        }
            
                        else if(result.length > 0){                  //already exist Device_ID
                            return res.status(402).json({               
                                success: 1,
                                message:'Already exist device_ID',
                                //token: token
                            })       
            
            
                        }else{
                            mysqlConnection.query('insert into DEVICE (device_id) values(?);',
                            [device_id],(error,rows,fileds)=>{
       

                            mysqlConnection.query('insert into USER (user_name,password,email,mobile_number) values(?,?,?,?);',
                            [user_name,hashedPassword,email,mobile_number],(error,rows,fileds)=>{

                            mysqlConnection.query('insert into OWNERSHIP (device_id,user_name) values(?,?);',
                            [device_id,user_name],(error,rows,fileds)=>{
                            if(!error){
                                return res.status(200).json({
                                    success: 1,
                                    message:'Successfully signup',
                                    //token: token
                                })
                            }else{
                                console.log(error);
                            }

    
            })
        })

    })

                        }
                    });
            }
        }); 



        })

      }
      catch {
        res.redirect('/')
      }
    }
    
    
  })

  module.exports = Router
