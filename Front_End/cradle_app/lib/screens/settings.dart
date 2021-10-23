import 'dart:convert';

import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:cradle_app/screens/dashBoard.dart';
import 'package:cradle_app/screens/select_device.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class SETTINGPage extends StatefulWidget {
  @override
  _State1 createState() => _State1();
}

//String speed='';
String state='';


class _State1 extends State<SETTINGPage>  {




   //=================================================================================================
   setting(String state,String max_temp) async {
    try {
      //print("1\n");
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String tok = await storage.read(key:"token");
      print(tok);
     
      String d_id = await storage.read(key:"device_id");
      print(d_id);

      final response = await http.post(
        Uri.parse('http://192.168.43.95:8000/setting'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer $tok'
        },
        body: jsonEncode(<String, String>{
          
         
          'device_id':d_id,
          'max_temp': max_temp,
          'state':state,
        }),
      );
      print(response.statusCode);
      print(response.body);
      //////
       if (response.statusCode == 200) {

         print("success");
        
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















 String max_temp='';




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
        title: Text("Settings",style: TextStyle(color: Colors.purple[900]),),

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
                    
                    
                  ],
                ),
               Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/set.jpeg") //add  an image to fan page
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
                
              

            
              
            
            Padding(
                  padding: const EdgeInsets.only(bottom:10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.thermostat,"Enter the temperature to automatically switch on fan"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Enter the temperature';
                      }
                      return null;
                    },

                    onChanged: (String value){
                      max_temp = value;
                    },


                    
                  ),
                ),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Automatic Fan         ", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
                                  if(isSwitched==true){
                                    state="on";
                                  }else{
                                    state="off";
                                  }
                                  print(isSwitched);
                                  print(state);
                                  print(isSwitched);

                                  setting(state, max_temp);
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



               //=====================
                  MaterialButton(
                    minWidth: 150,
                   // height: 50,
                    onPressed: (){
                      showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('You have successfully set the temperature\nto Switch on fan Automatically'),
                  content:
                      const Text('Automatic Fan option Available Now !'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoardPage(
                            //title: '',
                          ),
                        ),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
         
                    },
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.black,width:2)
                    ),
                    child: Text(
                      "Save Setting changes",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),

                    ),
                  ),
               //====================
              
               



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