const express = require('express')
//const bcrypt = require('bcrypt')

const Joi =require('joi')
const Router = express.Router()
var mysqlConnection = require('../connection/connection')

const jwt =require('jsonwebtoken')
const  ensureToken  = require('../middleware/authenticate')

Router.post('/', ensureToken,function(req, res) {
  

    const {user_name,device_id}=req.body;
    console.log(req.body);
    //console.log(req.headers);

    //server side validation

    const schema = Joi.object({

        user_name: Joi.string().max(10).required(),
        
        device_id:Joi.string().pattern(/^[0-9]+$/).required()
        
    });

    const result = schema.validate(req.body);

    if(result.error){

        res.status(400).send(result.error.details[0].message);
        return;
    }
    var sql = "SELECT user_name FROM OWNERSHIP where device_id = BINARY ?";

    jwt.verify(req.token,'my_secret_key',function(error,data){

        if(error){
            return res.status(401).json({   //            
                success: 1,
                message:'Invalid input',
                //token: token
            })
            
        }else{

            mysqlConnection.query(sql,
                [device_id],(error, result) => {
        
                    if(error){
        
                        console.log(error);
        
                    }
        
                    if(!(result.length > 0)){ 
                                
                        return res.status(402).json({               
                            success: 1,
                            message:'No This Device Id in database',
                            //token: token
                        })
        
        
                    }else{
                        //==================
                        if((result[0].user_name)==data.user_name){
                            return res.status(200).json({               
                                success: 1,
                                message:'Successfull',
                                device_id:device_id
                            })
                        }
                        else{
                            return res.status(403).json({               
                                success: 0,
                                message:'You have not this device_id',
                                //token: token
                            })
                        }
                       
                        //==================
                        
                    }
                }); 
           

        }
    })


 /*   mysqlConnection.query(sql,
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
        */ 
  })

  module.exports = Router




