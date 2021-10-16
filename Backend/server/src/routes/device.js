const{Router} = require('express');

const router = Router();

const mysqlConnection =require('../connection/connection');

/*
router.get('/',(req,res)=>{

    res.status(200).json('Server on and database is connected');
});
*/

router.get('/',(req,res)=>{

    mysqlConnection.query('select *from DEVICE;',(error,rows,fileds)=>{

        if(!error){
            res.json(rows);
        }else{
            console.log(error);
        }
    });
});

router.post('/',(req,res)=>{

    const {device_id,temperature,cry_analysis,fan}=req.body;
    console.log(req.body);
    mysqlConnection.query('insert into DEVICE (device_id,temperature,cry_analysis,fan) values(?,?,?,?);',
    [device_id,temperature,cry_analysis,fan],(error,rows,fileds)=>{

        if(!error){
            res.json({Status:'Device added'});
        }else{
            console.log(error);
        }
    });
});

module.exports=router;