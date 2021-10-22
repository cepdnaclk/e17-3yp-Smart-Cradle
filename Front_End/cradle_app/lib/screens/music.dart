import 'package:flutter/material.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';

import 'package:cradle_app/screens/dashBoard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cradle_app/screens/login.dart';
import 'package:cradle_app/screens/select_device.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cradle_app/screens/signup.dart';
import 'dart:convert';



class MusicPage extends StatefulWidget {
  @override
  _Mstate createState() => _Mstate();
}


class _Mstate extends State<MusicPage>  {
  //bool isSwitched = false;
  //bool _value = false;
  //int val = -1;


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
   setSong(String dropdownvalue,String state) async {
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
        Uri.parse('http://192.168.43.95:8000/song'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer $tok'
        },
        body: jsonEncode(<String, String>{
          
          //changed by hasara
          'device_id':d_id,
          'song': dropdownvalue,
          'state':state,

        }),
      );
      print(response.statusCode);
      print(response.body);
      //////
       if (response.statusCode == 200) {
         
         //changed by hasara
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardPage()));
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
                          builder: (context) => MusicPage(
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
                          builder: (context) => MusicPage(
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
                          builder: (context) => MusicPage(
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
  //===================

  String dropdownvalue ;
  String check = "-1";

  String state;
  var items =  ["Rock-A-Bye Baby","Twinkle Twinkle Little Star","Hush Little Baby"];

     @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
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
                    Text("Music",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color:Colors.blue),),
                   // SizedBox(height: 25,),
                    
                    Text("Play some music to soothe your baby...",
                    style: TextStyle(
                      fontSize: 15,
                    color:Colors.blue),)
                  ],
                ),
               Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/music.jpeg") //add  an image to fan page
                  )
                ),
              ),
              
                
                
              
              
                               
            Padding(
              padding:EdgeInsets.only(bottom: 20,left: 63,right: 63),

              child: Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blue[50],
              border: Border.all()),


              child: (
                DropdownButton(
                  value: dropdownvalue,
                  //icon: Icon(Icons.keyboard_arrow_down),
                  items:items.map((String items) {
                       return DropdownMenuItem (
                           value: items,
                           child: Text(items)
                       );
                  }
                  ).toList(),
                onChanged: (String newValue){
                  setState(() {
                    dropdownvalue = newValue;
                    check = newValue;
                    print(check);
                  });
                },
              hint:Text("Select a Song",
              style: TextStyle(color: Colors.indigo[800],fontSize: 20, fontWeight: FontWeight.bold),),
              disabledHint:Text("Disabled"),
              //elevation: 80,
              style:TextStyle(color:Colors.blue[900], fontSize: 20,fontWeight: FontWeight.bold),
              icon: Icon(Icons.arrow_drop_down_circle),
              iconDisabledColor: Colors.red,
              iconEnabledColor: Colors.blue[900],
              isExpanded: true,
              dropdownColor: Colors.blue[50],
            
              
              )
            ),
          ),
            ),

                Padding(
                  padding: EdgeInsets.only(bottom: 50,left:100 ,right: 50), //shashini -100 //emu-80
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 50,
                        color: Colors.green[900],
                        icon: Icon(Icons.play_circle),
                        onPressed: () {
                          print('start');
                          state='start';
                          print(state);

                          setSong(dropdownvalue,state);  //changed by hasara
                        }
        
                       ),
        
                       IconButton(
                        iconSize: 65,
                        color: Colors.red[900],
                        icon: Icon(Icons.stop),
                        onPressed: () {

                        print('stop');
                        state='stop';
                        print(state);

                        setSong(dropdownvalue,state);  //changed by hasara

                        }
                      ),
                      
                     
                    ],
                  ),
                

                
                ),
                //==
                
                    Padding(
                      padding: EdgeInsets.only(bottom: 30,left: 50,right: 10), //250
                      child: Row(
                        children:<Widget>[

                          FlutterVolumeSlider(
                            display: Display.HORIZONTAL,
                            sliderActiveColor: Colors.blue,
                            sliderInActiveColor: Colors.grey,
                          ),
                      
                        ],
                      ),
                    ),
                  ],
                

               



              
            ))
          ],
        ),
      ),
    );
  }

}


