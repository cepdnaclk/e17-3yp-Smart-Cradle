const express = require('express')
//const bcrypt = require('bcrypt')

const Joi =require('joi')
const Router = express.Router()
var mysqlConnection = require('../connection/connection')

const jwt =require('jsonwebtoken')
const  ensureToken  = require('../middleware/authenticate')

const mqtt=require("mqtt");
var client =mqtt.connect('mqtt://broker.hivemq.com');

client.on('connect',function(){

    client.subscribe("cradle/temperature");
    console.log("Subscribed Successfully");


});

var temperature_val='';

client.on('message',function(topic,message){

    console.log(message.toString());

    temperature_val=message.toString();
    // sending the response to the mobile app
   
    
});


Router.post('/', ensureToken,function(req, res) {
  

    const {device_id}=req.body;
    console.log(req.body);


   

    //console.log(state);
    //console.log(max_temp);

    //server side validation
    const schema = Joi.object({
        device_id:Joi.string().pattern(/^[0-9]+$/).required(),
       // state:Joi.string().min(2).max(3).required(),
        
       // max_temp:Joi.string().min(2).max(3).required(),
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
                        //res.json({Status:'Checking the Room tempereature....'});
                        console.log("Checking the Room temperature...");


                        // mqtt sub method
/*
                        client.on('connect',function(){

                            client.subscribe("cradle/temperature");
                            console.log("Subscribed Successfully");
                        
                        
                        });
                        */

                        /*
                        client.on('message',function(topic,message){

                            console.log(message.toString());

                            const temperature_val=message.toString();
                            // sending the response to the mobile app
                            return res.status(200).json({
                                success: 1,
                                message:temperature_val,
                               
                            })
                            
                        });
                        
                        */

                        return res.status(200).json({
                            success: 1,
                            message:temperature_val,
                           
                        });

                       client.end();

                       


                        // end of mqtt
                        
                        


                        //==
                    }
                    
                    else{
                        res.json({Status:'Wrong Device ID'});
                    }
                    
                });
            

        }
    })




  })

  module.exports = Router
