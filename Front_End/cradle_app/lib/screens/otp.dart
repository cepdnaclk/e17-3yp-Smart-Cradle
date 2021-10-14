import 'package:flutter/material.dart';
import 'InputDeco_design.dart';

import 'package:cradle_app/screens/selectDevice.dart';
class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}
String name;
class _OTPPageState extends State<OTPPage> {

  String validatePassword(value){
    if(value.isEmpty){
      return "Please Enter Received OTP";
    }
    else if(value.length!=6){
      return "Please Enter 6 Digit, Received OTP";
    }
    else{
      name = value;
      return null;
    }
  }

  

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //==
      appBar: AppBar(
        //elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.purple[100],
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
      ),
      //==
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                children: <Widget>[
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              
               CircleAvatar(
                  backgroundColor: Colors.white,
                  radius:90,
                  child: Image.asset("assets/images/otp.jpeg"),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.lock,"___ ___ ___  ___ ___ ___"),
                    validator: validatePassword,
                    
                  ),
                ),

                SizedBox(
                  height:10
                ),
                
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.purple[700],
                    onPressed: (){

                      if(_formkey.currentState.validate())
                      {
                        print("successful");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));
                        print(name);

                       // return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black,width:2)
                        
                    ),
                    textColor:Colors.white,child: Text("SUBMIT"),

                  ),
                ),
                //==
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Didn't Received  an OTP?"),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0), //250
                      child: Row(
                        children:<Widget>[
                          TextButton(
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                              print("Resend OTP");
                            },
                            child: Text("Resend"),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                //==
              ],
            ),
          ),
        ),
      ),
    );
  }
}
