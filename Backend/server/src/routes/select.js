const{Router} = require('express');

const router = Router();

const mysqlConnection =require('../connection/connection');
const jwt =require('jsonwebtoken')
const  ensureToken  = require('../middleware/authenticate')

var sql = "SELECT device_id  from OWNERSHIP WHERE user_name = ?";
router.get('/',ensureToken,(req,res)=>{

    const {user_name}=req.body;
    console.log(req.body);

    jwt.verify(req.token,'my_secret_key',function(error,data){

        if(error){
            res.sendStatus(403);
        }else{
            mysqlConnection.query(sql,[user_name],(error,rows,fileds)=>{

                if(!error){
                    res.json(rows);
                }else{
                    console.log(error);
                }
            });

        }
    })


  
});



module.exports=router;