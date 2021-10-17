const express = require('express')
//const bcrypt = require('bcrypt')

const Joi =require('joi')
const Router = express.Router()
var mysqlConnection = require('../connection/connection')

Router.post('/', function(req, res) {
  

    const {device_id,fan}=req.body;
    console.log(req.body);

    //server side validation

    const schema = Joi.object({
        device_id:Joi.string().pattern(/^[0-9]+$/).required(),
        fan:Joi.string().min(2).max(3).required(),
    });

    const result = schema.validate(req.body);

    if(result.error){

        res.status(400).send(result.error.details[0].message);
        return;
    }

    var sql = `SELECT * from DEVICE WHERE device_id = ${device_id} `;

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
        });   
  })

  module.exports = Router
