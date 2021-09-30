import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:cradle_app/otp.dart';

class LoginPageNew extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageNew> {

  GlobalKey <FormState> formkey = GlobalKey <FormState>();

  void validate(){

    if(formkey.currentState!.validate()){
      print("Not valid");
    }else{
      print("Valid");
    }

  }

  String validatePassword(value){

    if(value.isEmpty){
      return "required *";
    }else if (value.length < 6 ){ 
      return "should be atleast 6 characters";
    }else if (value.length >15){
      return "should not be more than 15 characters";
    }else{
      return " ";
    }


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,),


        ),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>  [
            Expanded(child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                    children: <Widget>[
                    Text("Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Login to your account",
                    style: TextStyle(
                      fontSize: 15,
                    color:Colors.grey[700]),)
                  ],
                ),
            

                Padding(
                  padding: EdgeInsets.all(
                    15.0
                    
                  ),

                  child: Center(
                    child:Form (
                      // ignore: deprecated_member_use
                      autovalidate: true,
                      key: formkey,
                      child: Column(
                        children: <Widget>[
                          
                          TextFormField(
                            decoration: InputDecoration(
                              //fillColor: Colors.purple,
                              
                              border: OutlineInputBorder(),labelText: "Username"),
                              
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "required *"),

                                ]
                              ),

                            
                          ),
                Padding(
                  padding: EdgeInsets.only(
                    top:15.0
                  ),

                  child: Center(
                    child:Form (
                  
                      child: Column(
                        children: <Widget>[

                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(

                              border: OutlineInputBorder(),labelText: "Password"),

                              validator: validatePassword
                          ),

                        
                Padding(padding:
                  EdgeInsets.only(top: 30),
                  child: Container(
                      padding: EdgeInsets.only(top: 0, left: 0), //3
                      decoration:
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),

                          )



                        ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Otp()));
                        },
                        color: Colors.purple[700],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: Text(
                          "Login", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                        ),

                      ),
                    ),
                  ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    Text(" Sign up", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,

                    ),)
                  ],
                ),

                  
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 110), //250
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 80,
                        
                        color: Colors.blue,
                        icon: Icon(Icons.lock),
                        onPressed: validate,
        
                       ),
        
                      
                     
                    ],
                  ),
                

                
                ),
                          
                        ],
                        ) ,
                      
                      )
                     ),
            

                ),

                          
                        ],
                        ) ,
                      
                      )
                     ),
            

                ),
            
            
              ],

            )
            )

          ],










        ),





      ),


    );
  }
    
}

  
  