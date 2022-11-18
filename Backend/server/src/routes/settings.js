const express = require('express')
//const bcrypt = require('bcrypt')

const Joi =require('joi')
const Router = express.Router()
var mysqlConnection = require('../connection/connection')

const jwt =require('jsonwebtoken')
const  ensureToken  = require('../middleware/authenticate')

// mqtt 
const mqtt= require("mqtt");
var client=mqtt.connect('mqtt://broker.hivemq.com');

Router.post('/', ensureToken,function(req, res) {
  

    const {device_id,state,max_temp}=req.body;
    console.log(req.body);

   
    console.log(state);
    console.log(max_temp);

    //console.log(speed);

    //server side validation

    const schema = Joi.object({
        device_id:Joi.string().pattern(/^[0-9]+$/).required(),
        state:Joi.string().min(2).max(3).required(),
        
        max_temp:Joi.string().min(2).max(3).required(),
    });

    const result = schema.validate(req.body);

    if(result.error){

        res.status(400).send(result.error.details[0].message);
        return;
    }

    var sql = `SELECT * from DEVICE WHERE device_id = ${device_id} `;

    jwt.verify(req.token,'my_secret_key',function(error,data){

        if(error){
            res.sendStatus(403);

        }else{

            mysqlConnection.query(sql,
                [device_id],(error, result) => {
        
                    if(error){
        
                        console.log(error);
        
                    }
        
                    if(result.length > 0){
                        //==

                        //valid request
                        // mqtt
                        const data={
                            fan_state:state,
                            max_temperature:max_temp

                        };

                        var pub_data=JSON.stringify(data);
                        //console.log("JSON :",pub_data);

                        // mqtt pub method
                        client.publish('cradle/settings/temperature/state',pub_data);

                        // end of mqtt

                       

                        ///
                        if(state=='on'){
                            //mysqlConnection.query(`UPDATE DEVICE set fan=1  WHERE device_id=${device_id};`,
                            //[state],(error,rows,fileds)=>{
                                    
                                        res.json({Status:'Automatic option on'});
                                      //  res.sendStatus(200);
                                    }
        
            
                            //})
                        
                        else if(state=='off'){
                           
                                        res.json({Status:'Automatic option Off'});
                                      //  res.sendStatus(200);
                                    
        
            
                           // })
                            //==
                        }
                        
                        //==
                    }
                    else{
                        res.json({Status:'Wrong Device ID'});
                    }
                });
            

        }
    })



/*
    mysqlConnection.query(sql,
        [device_id],(error, result) => {

            if(error){

                console.log(error);

            }

            if(result.length > 0){
                //==
                if(fan=='on'){
                    mysqlConnection.query(`UPDATE DEVICE set fan=1  WHERE device_id=${device_id};`,
                    [fan],(error,rows,fileds)=>{
                            if(!error){
                                res.json({Status:'Successful'});
                            }else{
                                console.log(error);
                            }

    
                    })
                }
                else if(fan=='off'){
                    //==
                    mysqlConnection.query(`UPDATE DEVICE set fan=0  WHERE device_id=${device_id};`,
                    [fan],(error,rows,fileds)=>{
                            if(!error){
                                res.json({Status:'Successful'});
                            }else{
                                console.log(error);
                            }

    
                    })
                    //==
                }
                
                //==
            }
            else{
                res.json({Status:'Wrong Device ID'});
            }
        });   */
  })

  module.exports = Router
