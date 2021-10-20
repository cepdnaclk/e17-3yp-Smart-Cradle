import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:cradle_app/screens/login.dart';
import 'dart:convert';

//import 'package:dio/dio.dart';

//import 'package:flutter_svg/svg.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:untitled/constants.dart';
import 'package:http/http.dart' as http;


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

  
  String name,email,phone,device,conf_password,password_;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //http
  signUp(String name, String email, String mobileno,String deviceid,String password, String confpassword) async {
    try {
      //print("1\n");
      final response = await http.post(
        Uri.parse('http://192.168.43.95:8000/signups'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_name': name,
          'email': email,
          'mobile_number': mobileno,
          'device_id': deviceid,
          'password': password,
          'conf_password': confpassword,

          
        }),
      );
      print(response.statusCode);
      print(response.body);
      
      


      
      //////
       if (response.statusCode == 200) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Registration is Successful'),
                  content:
                      const Text('You can login in to your Account Now'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(
                            //title: '',
                          ),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } 
            //////////////////////////////
            else if (response.statusCode == 400){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Registration ERROR !'),
                  content:
                      const Text('Invalid Input\n"Try again with Valid Inputs'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(
                            //title: '',
                          ),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
            //////////////////////////////
            
            else if (response.statusCode == 401){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Registration ERROR !'),
                  content:
                      const Text('Username already Exists\nTry again with another name'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(
                            //title: '',
                          ),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
            //==================================================================================================
            else if (response.statusCode == 402){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Registration ERROR !'),
                  content:
                      const Text('Device ID already Exists\nTry again with another Device ID'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(
                            //title: '',
                          ),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }

            /*else{
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
            }*/
            //==================================================================================================

      
      
      
      
      
      
      else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        print("throw");
        throw Exception('Failed to create album.');
      }
    } on Exception catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }






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
                      else if(value.length > 15){
                        return 'should not be more than 15 characters';
                      }
                      return null;
                    },
                    onChanged: (String value){
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
                      else if (value.length >50)
                      {
                      return "Should not be more than 50 characters";
                      }
                      else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z]").hasMatch(value)){
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                    onChanged: (String value){
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
                    onChanged: (String value){
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
                    onChanged: (String value){
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

                    onChanged: (String value){
                      password_ = value;
                    },
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

                     onChanged: (String value){
                      conf_password = value;
                    },

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
                        signUp(name, email, phone, device, password_, conf_password);
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

                        //return;
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
