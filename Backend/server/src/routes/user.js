const{Router} = require('express');

const router = Router();

const mysqlConnection =require('../connection/connection');

/*router.get('/',(req,res)=>{

    res.status(200).json('Server on and database is connected');
});*/

router.get('/',(req,res)=>{

    mysqlConnection.query('select *from USER;',(error,rows,fileds)=>{

        if(!error){
            res.json(rows);
        }else{
            console.log(error);
        }
    });
});

router.post('/',(req,res)=>{

    const {user_name,password,email,mobile_number,device_id}=req.body;
    console.log(req.body);
    mysqlConnection.query('insert into USER (user_name,password,email,mobile_number,device_id) values(?,?,?,?,?);',
    [user_name,password,email,mobile_number,device_id],(error,rows,fileds)=>{

        if(!error){
            res.json({Status:'User data aded'});
        }else{
            console.log(error);
        }
    });
});

module.exports=router;