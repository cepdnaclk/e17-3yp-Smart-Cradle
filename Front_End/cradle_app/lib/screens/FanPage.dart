import 'package:flutter/material.dart';
import 'package:cradle_app/screens/dashBoard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cradle_app/screens/login.dart';
import 'package:cradle_app/screens/select_device.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cradle_app/screens/signup.dart';
import 'dart:convert';

class FanPage extends StatefulWidget {
  @override
  _State createState() => _State();
}


//changed by hasara
String speed='';
String state='';

class _State extends State<FanPage>  {

  //changed by hasara
   void _showToast(BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Wrong Input'),
          //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }

   //=================================================================================================
   setfan(String speed ,String state) async {
    try {
      //print("1\n");
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String tok = await storage.read(key:"token");
      print(tok);
      //String u_name = await storage.read(key:"user_name");
      //print(u_name);

      //changed by hsara
      String d_id = await storage.read(key:"device_id");
      print(d_id);

      final response = await http.post(
        Uri.parse('http://10.30.84.209:9000/fans'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer $tok'
        },
        body: jsonEncode(<String, String>{
          
          //changed by hasara
          'device_id':d_id,
          'speed': speed,
          'state':state,
        }),
      );
      print(response.statusCode);
      print(response.body);
      //////
       if (response.statusCode == 200) {
         print("Successful");
        
             // Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardPage()));
      } 
      else if (response.statusCode == 400){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Inputs!'),
                  content:
                      const Text('Some problem with inputs'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FanPage(
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
            else if (response.statusCode == 402){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Inputs!'),
                  content:
                      const Text('WRONG INPUT'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>FanPage(
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
            else if (response.statusCode == 403){

                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Invalid Inputs!'),
                  content:
                      const Text('You have not this Device ID'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FanPage(
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
  //=================================================================================================



  bool isSwitched = false;
  bool _value = false;
    int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        title: Text("Fan",style: TextStyle(color: Colors.purple[900]),),
        backgroundColor: Colors.purple[100],
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
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                   
                    SizedBox(height: 20,),
                    
                    Text("Turn on fan to soothe your baby...",
                    style: TextStyle(
                      fontSize: 20,
                    color:Colors.orange[700]),)
                  ],
                ),
               Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/fan.jpeg") //add  an image to fan page
                  )
                ),
              ),
              /*Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children:<Widget>[

                /*
                Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home.jpg") //add  an image to welcome page
                  )
                ),
              ),
                     */ 
                     
                    ],
                  ),
                

                
                ),*/
             
                  
              /*Container(
                  padding: EdgeInsets.symmetric(horizontal: 80), //shashini -100
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 75,
                        color: Colors.green[900],
                        icon: Icon(FontAwesomeIcons.powerOff),
                        onPressed: () => print('On Fan'),
        
                       ),
        
                       IconButton(
                        iconSize: 75,
                        color: Colors.red[900],
                        icon: Icon(FontAwesomeIcons.powerOff),
                        onPressed: () => print('Off Fan'),
                      ),
                      
                     
                    ],
                  ),
                ),*/

                //
                
                //==
              
                /*children: <Widget>[
                  Text(
                    "ON/OFF",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              
              Container(
                child:Transform.scale(
                  scale:1.5,
                  child: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.red,
                    activeColor: Colors.red,
                  ),
                ),
              ),*/
                
                Column(
                children: <Widget>[
                  Text(
                    "Select speed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              
              
                ListTile(
                    title: Text("LOW"),
                    leading: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                        setState(() {
                        val = value;
                        speed=val.toString();
                        print(speed);
                        });
                    },
                    activeColor: Colors.red[200],
                    ),
                ),
                ListTile(
                    title: Text("MEDIUM"),
                    leading: Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                        setState(() {
                        val = value;
                        speed=val.toString();
                        print(speed);
                        });
                    },
                    activeColor: Colors.red[500],
                    ),
                ),
                ListTile(
                    title: Text("MAXIMUM"),
                    leading: Radio(
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                        setState(() {
                        val = value;
                        speed=val.toString();
                        print(speed);
                        });
                    },
                    activeColor: Colors.red[700],
                    ),
                ),
                //==
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("POWER         ", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color:Colors.red
                    ),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0), //250
                      child: Row(
                        children:<Widget>[
                          Container(
                            child:Transform.scale(
                            scale:1.8,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;

                                  //changed by hasara
                                  if(isSwitched==true){
                                    state="on";
                                  }else{
                                    state="off";
                                  }
                                  print(isSwitched);
                                  print(state);

                                  setfan(speed, state);
                                });
                              },
                              activeTrackColor: Colors.red,
                              activeColor: Colors.red,
                  ),
                ),
              ),
                        ],
                      ),
                    ),
                  ],
                ),

               



              ],
            ))
          ],
        ),
      ),
    );
  }

}


// we will be creating a widget for icons
 /*Widget buildNormalIcons() => GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          IconButton(
            iconSize: 80,
            color: Colors.blue,
            icon: Icon(Icons.videocam),
            onPressed: () => print('You can moniter the baby now'),
          ),
         

          IconButton(
            iconSize: 80,
            color: Colors.yellow,
            icon: Icon(Icons.music_note),
            onPressed: () => print('Play Music'),
          ),

          IconButton(
            iconSize: 80,
            color: Colors.green,
            icon: Icon(Icons.crib),
            onPressed: () => print('Swing the cardle'),
        
          ),
        
          IconButton(
            iconSize: 80,
            color: Colors.red,
            icon: Icon(Icons.thermostat),
            onPressed: () => print('Check the temperature'),
          ),
        
          IconButton(
            iconSize: 80,
            color: Colors.blue,
            icon: Icon(Icons.videocam),
            onPressed: () => print('You can moniter the baby now'),
          ),
        
        
        
        
        
        ],
      );*/