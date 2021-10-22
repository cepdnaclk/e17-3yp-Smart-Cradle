import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:cradle_app/screens/select_device.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class Remove_devicePage extends StatefulWidget {
  @override
  _Remove_deviceState createState() => _Remove_deviceState();
}

class _Remove_deviceState extends State<Remove_devicePage> {

  String validatePassword(value){
    if(value.isEmpty){
      return "required *";
    }
    else{
      return null;
    }
  }

  String name='';
  String deviceid='';

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //==================================================================================================================================
  remove(String user_name,String device_id) async {
    try {
      //print("1\n");
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String tok = await storage.read(key:"token");
      print(tok);
      String u_name = await storage.read(key:"user_name");
      print(u_name);
      final response = await http.post(
        Uri.parse('http://192.168.43.95:8000/remove'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer $tok'
        },
        body: jsonEncode(<String, String>{
          'user_name': user_name,
          'cor_user_name':u_name,
          'device_id':device_id
        }),
      );
      print(response.statusCode);
      print(response.body);
      //////
       if (response.statusCode == 200) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Device Deleted Succesfully'),
                  content:
                      const Text('Now You can select your another device'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Selectd(
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
            else if (response.statusCode == 400 || response.statusCode == 401){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('ERROR With Adding New Device!'),
                  content:
                      const Text('Invalid Input\nTry again with Valid Inputs'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Remove_devicePage(
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
            else if (response.statusCode == 402){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Username!'),
                  content:
                      const Text('Enter your registered Username'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Remove_devicePage(
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
            else if (response.statusCode == 403){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('ERROR!'),
                  content:
                      const Text('Some Thing Wrong With Token'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Remove_devicePage(
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
            else if (response.statusCode == 404){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Inputs!'),
                  content:
                      const Text('Enter Device Id which you want to Delete..'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Remove_devicePage(
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
            else if (response.statusCode == 405){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Input !!'),
                  content:
                      const Text('Please Enter Device ID which you want to delete..'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Remove_devicePage(
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
            else if (response.statusCode == 407){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('This not your Login User Name !!'),
                  content:
                      const Text('Please use Your Correct User Name'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Remove_devicePage(
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
  //==================================================================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //==
      appBar: AppBar(
        //elevation: 0,
        brightness: Brightness.light,
        title: Text("Remove your Device",style: TextStyle(color: Colors.purple[900]),),
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
                  radius:70,
                  child: Image.asset("assets/images/delete.jpg"),
                ),
                SizedBox(
                  height: 30,
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
                    onChanged: (String value){
                      name = value;
                    },
                  ),
                ),
                
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    //controller: password,
                    //obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.crib,"Device_ID"),
                    validator: validatePassword,
                    onChanged:(String value){
                      deviceid = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
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
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));
                        print(name);
                        print(deviceid);
                        remove(name,deviceid);

                       // return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black,width:2)
                        
                    ),
                    textColor:Colors.white,child: Text("Remove"),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
