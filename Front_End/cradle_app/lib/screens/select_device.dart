import 'package:flutter/material.dart';
import 'package:cradle_app/screens/dashBoard.dart';
import 'package:cradle_app/screens/add_device.dart';
import 'package:cradle_app/screens/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cradle_app/screens/signup.dart';
import 'dart:convert';
import 'InputDeco_design.dart';
class Selectd extends StatefulWidget {
  @override
  _SelectdState createState() => _SelectdState();
}
TextEditingController password = TextEditingController();
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _SelectdState extends State<Selectd> {
String dev_id='';
   void _showToast(BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Wrong Input.Enter YourDevice ID'),
          //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }

    

    
  //=================================================================================================
   adding(String dev_id) async {
    try {
      //print("1\n");
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String tok = await storage.read(key:"token");
      print(tok);
      String u_name = await storage.read(key:"user_name");
      print(u_name);
      final response = await http.post(
        Uri.parse('http://10.30.84.209:9000/select'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer $tok'
        },
        body: jsonEncode(<String, String>{
          'user_name': u_name,
          'device_id':dev_id
        }),
      );
      print(response.statusCode);
      print(response.body);
      //////
       if (response.statusCode == 200) {
              Map<String, dynamic> output = json.decode(response.body);

        await storage.write(key: "device_id", value: output["device_id"]);
        String dev_id = await storage.read(key: "device_id");
        print(dev_id);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardPage()));
      } 
      else if (response.statusCode == 400){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Input!'),
                  content:
                      const Text('Device ID Should be a Number'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));
                            },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } 
            else if (response.statusCode == 402){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Input!'),
                  content:
                      const Text('Invalid Device ID'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));
                            },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } 
            else if (response.statusCode == 403){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Input!'),
                  content:
                      const Text('Access Denied !'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));
                            },
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
  //=================================================================================================

  @override
  Widget build(BuildContext context) {
    String validatePassword(value){
    if(value.isEmpty){
      return "required *";
    }
    else{
      return null;
    }
  }

    return Scaffold(

      appBar: AppBar(
        //elevation: 0,
        brightness: Brightness.light,
        title: Text("Select Your Device",style: TextStyle(color: Colors.purple[900]),),
        backgroundColor: Colors.purple[100],
        leading: IconButton(
           onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
      ),
      
      body: Center(
        child: SingleChildScrollView(
        //height: MediaQuery.of(context).size.height,
        //width: double.infinity,
        child: Column(  
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                SizedBox(
                  height: 15,
                ),
                              
               CircleAvatar(
                  backgroundColor: Colors.white,
                  radius:90,
                  child: Image.asset("assets/images/cradle.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                
            Padding(
                  //pass_word=null;
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.crib,"Enter your Device ID"),
                    validator: validatePassword,
                    onChanged: (String value){
                      dev_id = value;
                    },
                  ),
                ),
              SizedBox(
                  height: 15,
                ),
               
                  MaterialButton(
                    minWidth: 150,
                   // height: 50,
                    onPressed: (){
                      
                      if(dev_id != ''){
                          adding(dev_id);
                      }
                      else{
                        _showToast(context);
                      }
                      
                    },
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.black,width:2)
                    ),
                    child: Text(
                      "Select",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Want to add a new device?"),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0), //250
                      child: Row(
                        children:<Widget>[
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_devicePage()));
                              print("Add device");
                            },
                            child: Text("CLICK HERE"),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
    
              ],
            
          
        ),
      ),

      ),

    );
  }
}
