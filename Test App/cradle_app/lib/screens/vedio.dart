import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url=Uri.parse('https://flutter.dev');


class vedioPage extends StatelessWidget {
////////
    Future<void> _launchUrl()async {
    
    if (!await launchUrl(_url)){
      
      throw 'Could not launch $_url';
    }
  }

  ///////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        title: Text("Monitor",style: TextStyle(color: Colors.purple[900]),),

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
        ///////////////////////////////
        /*
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Monitor Your baby",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color:Colors.indigo[900]),),
                    SizedBox(height: 30,),
                    
                    Text("Loading...",
                    style: TextStyle(
                      fontSize: 20,
                    color:Colors.indigo[900]),)
                  ],
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
             
                  
              
               



              ],
            ))
          ],
        ),

        ///////////////////////////////////////////////////////////////////
        ///
        */

       child: TextButton(
              onPressed: _launchUrl,
              child: 
              //Text('Click here to get a live feedback of your baby'),
              Text("Click Here to Monitor Your Baby",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color:Colors.indigo[900]),),
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