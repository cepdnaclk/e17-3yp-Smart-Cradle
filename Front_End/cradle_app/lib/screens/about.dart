import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //elevation: 0,
        brightness: Brightness.light,
        title: Text("Feature Avaiablle in the App ",style: TextStyle(color: Colors.purple[900]),),
        backgroundColor: Colors.purple[100],
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen
          color: Colors.white,  //add backgroud colour
          width: double.infinity,
         // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Column(
                children: <Widget>[

                

              ListTile(  
              leading: Icon(Icons.video_camera_back_rounded),  
              title: Text('Monitor'),  
            ),
            Text("You can monitor the baby at any time staying at any place..",
                 // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,

                  ),),


            Divider(),

             ListTile(  
              leading: Icon(Icons.music_note_outlined),  
              title: Text('Music'),  
            ),
            Text("Select your favourite music from the dropdown list..\nContol the volume as you want",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,

                  ),),


            Divider(),

            ListTile(  
              leading: Icon(FontAwesomeIcons.fan),  
              title: Text('Fan'),  
            ),
            Text("Select power on\nSelect the control speed as you want",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,

                  ),),


            Divider(),

            ListTile(  
              leading: Icon(Icons.thermostat),  
              title: Text('Temperature'),  
            ),
            Text("You can check the room temperature where the cradle is placed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,

                  ),),

            //Divider(),
            Divider(),

            ListTile(  
              leading: Icon(Icons.crib),  
              title: Text('Swing'),  
            ),
            Text("Make it on\nSelect your reqiuried swing pattern from the dropdown list..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 12,

                  ),),


            Divider(),
            
              ListTile(  
              leading: Icon(Icons.settings), 
              title: Text('Settings'),  
            ),
            Text("you can make turn on automatic fan Option\nSelect the temperature to turn on it automatically",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,

                  ),),

                  




           
            


                ],
              ),

              

              //////
            ],
          ),
        ),
      ),
      ),
    );
  }
}

