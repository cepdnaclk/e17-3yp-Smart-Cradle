const express = require('express')
const Joi =require('joi')
const bcrypt = require('bcrypt'); 
const Router = express.Router()
const jwt =require('jsonwebtoken')
//const  ensureToken  = require('../middleware/authenticate')

var mysqlConnection = require('../connection/connection')


Router.post('/',function(req, res) {
  

    const {user_name,password}=req.body;
    console.log(req.body);

    //server side validation

    const schema = Joi.object({

        user_name: Joi.string().max(10).required(),
        
        password:Joi.string().min(6).max(15).required(),
 
    });

    const result = schema.validate(req.body);

    if(result.error){

        res.status(400).send(result.error.details[0].message);
        return;
    }



    var sql = "SELECT * from USER WHERE user_name = BINARY ?";

    mysqlConnection.query(sql,
        [user_name],(error, result) => {
            //console.log(result);
            if(error){
                console.log(error);
            }

            else if(result.length > 0){
                //res.json({Status:'Successful login'});

                //result.password=undefined;
                bcrypt.compare(password,result[0].password).then((match)=>{
                    if(match){
                        //==
                        const user_name=req.body.user_name;

                        const user={user_name:user_name};

                        const token= jwt.sign(user,'my_secret_key');

                        /*res.json({

                            success:1,
                            message:'Successful Login',
                            token: token
                        })*/
                        //==
                        //==
                        return res.status(200).json({
                            success: 1,
                            message:'Successful Login',
                            token: token,
                            user_name:user_name,
                        })
                        //==
                    }
                    else{
                        return res.status(403).json({
                            success: 0,
                            message:'Invalid Password'
                            //token: token
                        })
                    }
                })

            }else{
                return res.status(403).json({
                    success: 0,
                    message:'Invalid Username'
                    //token: token
                })


            }
        });
})

  module.exports = Router



