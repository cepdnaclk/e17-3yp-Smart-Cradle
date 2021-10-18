import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:cradle_app/screens/dashBoard.dart';

class SETTINGPage extends StatefulWidget {
  @override
  _State1 createState() => _State1();
}


class _State1 extends State<SETTINGPage>  {
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
                    Text("Settings",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color:Colors.orange[700]),),
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
                                  print(isSwitched);
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
            Padding(
                  padding: const EdgeInsets.only(bottom:10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.thermostat,"Enter the temperature to automatically switch on fan"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    
                  ),
                ),
               //=====================
                  MaterialButton(
                    minWidth: 150,
                   // height: 50,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
                      print("Settings added");
                    },
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.black,width:2)
                    ),
                    child: Text(
                      "Enter",
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