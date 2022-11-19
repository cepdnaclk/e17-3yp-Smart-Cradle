import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:cradle_app/screens/select_device.dart';
import 'package:cradle_app/screens/signup.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String validatePassword(value){
    if(value.isEmpty){
      return "required *";
    }
    else{
      return null;
    }
  }
  //String? user_name;
  //String? password;
  final storage = const FlutterSecureStorage();
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  logIn(String user_name, String password) async {
    //try {
      //print("1\n");
      final response = await http.post(
        Uri.parse('http://10.30.84.209:9000/logins'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          
        },
        body: jsonEncode(<String, String>{
          'user_name': user_name,
          'password': password,
        }),
      );
      print(response.statusCode);
      print(response.body);

      /*if(response.statusCode == 200){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));
        
      }*/
      if(response.statusCode == 403 || response.statusCode == 400){
        //==
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Username Or Password!!!'),
                  content:
                      const Text("If you Havn't Registered yet,Go to signup page"),
                  actions: <Widget>[

                    TextButton(
                      onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                            },
                      child: const Text('Sign Up'),
                    ),
                    
                    TextButton(
                      onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                            },
                      child: const Text('Ok'),
                    ),

                    
                  ],
                  
                ),
              );
        //==
      }
      else if (response.statusCode == 200) {
        //print("200");

        Map<String, dynamic> output = json.decode(response.body);
        //print(output["token"]);

        await storage.write(key: "token", value: output["token"]);
        String tok = await storage.read(key: "token");
        await storage.write(key: "user_name", value: output["user_name"]);
        String u_name = await storage.read(key: "user_name");
        print("token from stored");
        print(tok);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));
      } else {
        // If the server did not return a 200 CREATED response,
        // then throw an exception.
        print("throw");
        throw Exception('Failed to create album.');
      }

      /*if (response.statusCode == 403) {
        Fluttertoast.showToast(
            msg: "Entered email or password Incorrect!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }

      if (response.statusCode == 200) {
        //print("200");

        Map<String, dynamic> output = json.decode(response.body);
        //print(output["token"]);

        await storage.write(key: "token", value: output["token"]);
        String? tok = await storage.read(key: "token");
        print("token from stored");
        print(tok);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
          (route) => false,
        );
        //return Album.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 CREATED response,
        // then throw an exception.
        print("throw");
        throw Exception('Failed to create album.');
      }
    } on Exception catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }*/
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  String name='';
  String pass_word='';

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
                  radius:90,
                  child: Image.asset("assets/images/login2.jpg"),
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
                      //return null;
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
                  //pass_word=null;
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Password"),
                    validator: validatePassword,
                    onChanged: (String value){
                      pass_word = value;
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

                       // return;
                      }else{
                        print("UnSuccessfull");
                      }
                      print (name);
                      print(pass_word);
                      if(name != '' && pass_word != ''){
                          logIn(name,pass_word);
                          //name = null;
                          //pass_word = null;
                      }
                      
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black,width:2)
                        
                    ),
                    textColor:Colors.white,child: Text("Login"),

                  ),
                ),
                //==
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0), //250
                      child: Row(
                        children:<Widget>[
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                            },
                            child: Text("Sign up"),
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
