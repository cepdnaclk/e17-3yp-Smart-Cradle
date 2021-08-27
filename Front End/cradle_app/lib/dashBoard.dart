import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cradle_app/music.dart';
import 'package:cradle_app/temperature.dart';


class DashBoardPage extends StatelessWidget {
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
                    Text("Dashboard",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("welcome to the dashboard",
                    style: TextStyle(
                      fontSize: 15,
                    color:Colors.grey[700]),)
                  ],
                ),
               
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),   //shashini-200
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 80,
                        color: Colors.indigo[900],
                        icon: Icon(Icons.videocam),
                        onPressed: () => print('You can moniter the baby now'),
                       ),
         
                      IconButton(
                        iconSize: 80,
                        color: Colors.blue,
                        icon: Icon(Icons.music_note),
                        
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MusicPage()));
                        },
                      ),
                      
                     
                    ],
                  ),
                

                
                ),
             
                  
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100), //shashini -200
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 80,
                        color: Colors.green[900],
                        icon: Icon(Icons.crib),
                        onPressed: () => print('Swing the cardle'),
        
                       ),
        
                       IconButton(
                        iconSize: 80,
                        color: Colors.red[900],
                        icon: Icon(Icons.thermostat),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Temp()));
                        },
                      ),
                      
                     
                    ],
                  ),
                

                
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 130), //shashini -250
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 80,
                        
                        color: Colors.deepOrange,
                        icon: Icon(FontAwesomeIcons.fan),
                        onPressed: () => print('Switch on the fan'),
        
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
            onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Temp()));
                        },
          ),
        
          IconButton(
            iconSize: 80,
            color: Colors.blue,
            icon: Icon(Icons.videocam),
            onPressed: () => print('You can moniter the baby now'),
          ),
        
        
        
        
        
        ],
      );*/
