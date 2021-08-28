import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
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
                    Text("Fan",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color:Colors.orange[700]),),
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
             
                  
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80), //shashini -100
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 75,
                        color: Colors.green[900],
                        icon: Icon(FontAwesomeIcons.toggleOn),
                        onPressed: () => print('On Fan'),
        
                       ),
        
                       IconButton(
                        iconSize: 75,
                        color: Colors.red[900],
                        icon: Icon(FontAwesomeIcons.toggleOff),
                        onPressed: () => print('Off Fan'),
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