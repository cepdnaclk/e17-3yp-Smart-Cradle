import 'package:flutter/material.dart';
import 'package:cradle_app/screens/dashBoard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cradle_app/screens/login.dart';
import 'package:cradle_app/screens/select_device.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cradle_app/screens/signup.dart';
import 'dart:convert';


class SwingPage extends StatefulWidget {
  @override
  _Sstate createState() => _Sstate();
}

class _Sstate extends State<SwingPage>  {
  //bool isSwitched = false;
 // bool _value = false;
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
   setSwing(String dropdownvalue,String state) async {
    try {
      //print("1\n");
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String tok = await storage.read(key:"token");
      print(tok);
      //String u_name = await storage.read(key:"user_name");
      //print(u_name);

     
      String d_id = await storage.read(key:"device_id");
      print(d_id);

      final response = await http.post(
        Uri.parse('http://192.168.43.95:9000/swing'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer $tok'
        },
        body: jsonEncode(<String, String>{
          
          
          'device_id':d_id,
          'pattern': dropdownvalue,
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
                          builder: (context) => SwingPage(
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
                          builder: (context) => SwingPage(
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
                          builder: (context) => SwingPage(
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



  
  String dropdownvalue ;
  String check = "-1";

  String state;
  var items =  ["Pattern 1","Pattern 2","Pattern 3"];

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
        title: Text("Swing the cradle",style: TextStyle(color: Colors.purple[900]),),
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
                   
                   // SizedBox(height: 25,),
                    
                    Text("Swing the cradle to soothe your baby...",
                    style: TextStyle(
                      fontSize: 20,
                    color:Colors.green[700]),)
                  ],
                ),
               Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/swing.PNG") //add  an image to fan page
                  )
                ),
              ),
              
                                             
            Padding(
              padding:EdgeInsets.only(bottom: 20,left: 63,right: 63),

              child: Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.green[50],
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
              hint:Text("Select a Pattern",
              style: TextStyle(color: Colors.green[800],fontSize: 20, fontWeight: FontWeight.bold),),
              disabledHint:Text("Disabled"),
              //elevation: 80,
              style:TextStyle(color:Colors.green[900], fontSize: 20,fontWeight: FontWeight.bold),
              icon: Icon(Icons.arrow_drop_down_circle),
              iconDisabledColor: Colors.red,
              iconEnabledColor: Colors.green[900],
              isExpanded: true,
              dropdownColor: Colors.green[50],
            
              
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
                        onPressed: (){

                        print('start');
                        state='start';
                        print(state);

                        setSwing(dropdownvalue,state);  //changed by hasara


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

                        setSwing(dropdownvalue,state);  //changed by hasara

                        }
                        
                      ),
                      
                     
                    ],
                  ),
                

                
                ),
                //==
               
               



              ],
            ))
          ],
        ),
      ),
    );
  }

}


