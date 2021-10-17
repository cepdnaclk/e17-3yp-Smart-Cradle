const{Router} = require('express');

const router = Router();

const mysqlConnection =require('../connection/connection');

var sql = "SELECT device_id  from OWNERSHIP WHERE user_name = ?";
router.get('/',(req,res)=>{

    const {user_name,device_id}=req.body;
    console.log(req.body);


    mysqlConnection.query(sql,[user_name],(error,rows,fileds)=>{

        if(!error){
            res.json(rows);
        }else{
            console.log(error);
        }
    });
});



module.exports=router;