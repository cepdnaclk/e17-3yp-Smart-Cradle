const{Router} = require('express');

const router = Router();

const mysqlConnection =require('../connection/connection');
/*
router.get('/',(req,res)=>{

    res.status(200).json('Server on and database is connected');
});
*/
router.get('/',(req,res)=>{

    mysqlConnection.query('select *from OWNERSHIP;',(error,rows,fileds)=>{

        if(!error){
            res.json(rows);
        }else{
            console.log(error);
        }
    });
});

router.post('/',(req,res)=>{

    const {device_id,user_name}=req.body;
    console.log(req.body);
    mysqlConnection.query('insert into OWNERSHIP (device_id,user_name) values(?,?);',
    [device_id,user_name],(error,rows,fileds)=>{

        if(!error){
            res.json({Status:'new device added'});
        }else{
            console.log(error);
        }
    });
});

module.exports=router;