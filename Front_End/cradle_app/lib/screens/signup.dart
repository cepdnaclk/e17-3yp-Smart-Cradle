

import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:cradle_app/screens/login.dart';
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String validatePassword(value){
    if(value.isEmpty){
      return "Please Enter Password";
    }else if (value.length < 6 ){ 
      return "should be atleast 6 characters";
    }else if (value.length >15){
      return "should not be more than 15 characters";
    }else{
      return null;
    }
  }

  String name,email,phone,device;

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
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Image.asset("assets/images/signup1.jpeg"),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Username"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.email,"Email"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter E-mail';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z]").hasMatch(value)){
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      email = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.phone,"Mobile number"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Phone No ';
                      }
                      if(value.length!=10)
                      {
                        return 'Should be a 10 Digit Number';
                      }
                      if(!RegExp("^[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]").hasMatch(value)){
                        return 'Please Enter valid Mobile number';
                      }                      
                      return null;
                    },
                    onSaved: (String value){
                      phone = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.crib,"Device ID"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Device Id ';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      device = value;
                    },
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Password"),
                    validator: validatePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Confirm Password"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please re-enter Password';
                      }
                      if (value.length < 6 )
                      { 
                        return "Should be atleast 6 characters";
                      }
                      if (value.length >15)
                      {
                      return "Should not be more than 15 characters";
                      }
                      print(password.text);

                      print(confirmpassword.text);

                      if(password.text!=confirmpassword.text){
                        return "Password does not match";
                      }

                      return null;
                    },

                  ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black,width:2)
                    ),
                    textColor:Colors.white,child: Text("SIGN UP"),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
