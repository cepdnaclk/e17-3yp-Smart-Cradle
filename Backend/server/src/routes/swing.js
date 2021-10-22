const express = require('express')
//const bcrypt = require('bcrypt')

const Joi =require('joi')
const Router = express.Router()
var mysqlConnection = require('../connection/connection')

const jwt =require('jsonwebtoken')
const  ensureToken  = require('../middleware/authenticate')

Router.post('/', ensureToken,function(req, res) {
  
    //variable pattern to store the swing pattern
    const {device_id,pattern,state}=req.body;
    console.log(req.body);

    //print pattern
    // 
    console.log("pattern=",pattern);
    console.log("state=",state);

    //server side validation

    const schema = Joi.object({
        device_id:Joi.string().pattern(/^[0-9]+$/).required(),
        pattern:Joi.string().required,
        state:Joi.string().required,
        
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

                        console.log("pattern received = ",pattern);
                        console.log("state received = ",state);
                        //res.status(200);
                        
                    }
                    else{
                        res.json({Status:'Wrong Device ID'});
                    }
                });
            

        }
    })

})

  module.exports = Router
