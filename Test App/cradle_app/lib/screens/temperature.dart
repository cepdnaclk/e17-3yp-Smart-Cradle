import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cradle_app/screens/dashBoard.dart';
import 'package:cradle_app/screens/add_device.dart';
import 'package:cradle_app/screens/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cradle_app/screens/signup.dart';
import 'dart:convert';
import 'InputDeco_design.dart';


class Temp extends StatefulWidget {

//
  @override
  State<Temp> createState() => _TempState();
  
}

class _TempState extends State<Temp> {
 String temperature='';


 @override
void initState() {
    super.initState();
     print("init");
     readTemp();
}

  Future<String>  readTemp() async {
    try {
      //print("1\n");
      FlutterSecureStorage storage = const FlutterSecureStorage();

      String dev_id= await storage.read(key:"device_id");
      String tok = await storage.read(key:"token");
      print(tok);
      String u_name = await storage.read(key:"user_name");
      print(u_name);
      final response = await http.post(
        Uri.parse('http://10.30.84.209:9000/temp'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer $tok'
        },
        body: jsonEncode(<String, String>{
          //'user_name': u_name,
          'device_id':dev_id
        })
      );
      print(response.statusCode);
      print(response.body);
      //////
       if (response.statusCode == 200) {
              Map<String, dynamic> output = json.decode(response.body);

       
        
        setState(() {
          temperature = output["message"];
        });
        print(temperature);
        return temperature.toString();
              
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        title: Text(temperature,style: TextStyle(color: Colors.black),),

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
                    
                    Text("You can check the room temperature...",
                    style: TextStyle(
                      fontSize: 20,
                    color:Colors.red[700]),)
                  ],
                ),
               Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/temp.jpeg") //add  an image 
                  )
                ),
              ),
              Padding(
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
                

                
                ),
              Column(
                  children: <Widget>[
                    //readTemp(dev_id),
                    Text("Room  ${temperature}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    
                   
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