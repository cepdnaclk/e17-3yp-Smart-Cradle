import 'package:cradle_app/screens/select-device.dart';
import 'package:cradle_app/screens/selectDevice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cradle_app/screens/music.dart';
import 'package:cradle_app/screens/temperature.dart';
import 'package:cradle_app/screens/FanPage.dart';
import 'package:cradle_app/screens/cradle.dart';
import 'package:cradle_app/screens/vedio.dart';
import 'package:cradle_app/screens/record.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        //elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.purple[100],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),
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
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Wrap(
                  spacing:10, //gap between colums
                  runSpacing: 5.0,  //gap between rows
                  children: <Widget>[
                    SizedBox(
                      width:130.0,
                      height: 116.0,
                      child: Card(
                        color: Colors.purple[100],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                            children: <Widget>[
                              //Image.asset("assets/todo.png",width: 64.0,),
                              IconButton(
                        iconSize: 80,
                        color: Colors.indigo[900],
                        icon: Icon(Icons.videocam),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> vedioPage())); //vediocam
                        },
                       ),
                        SizedBox(
                          height: 0.0,
                        ),
                        Text("Monitor",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10.0),),
                            ],
                            ),
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:130.0,
                      height: 116.0,
                      child: Card(
                        color: Colors.purple[100],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                            children: <Widget>[
                                  //Image.asset("assets/note.png",width: 64.0,),
                            IconButton(iconSize: 80,color: Colors.blue,icon: Icon(Icons.music_note),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MusicPage()));
                              },
                            ),
                            SizedBox(
                              height: 0.0,
                            ),
                            Text("Music",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10.0),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:130.0,
                      height: 116.0,
                      child: Card(
                        color: Colors.purple[100],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: <Widget>[
                                 // Image.asset("assets/calendar.png",width: 64.0,),
                        IconButton(iconSize: 80,color: Colors.green[900],icon: Icon(Icons.crib),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Swing())); // cradle
                          },
                        ),
                        SizedBox(
                          height: 0.0,
                        ),
                        Text("Swing",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10.0),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:130.0,
                      height: 116.0,
                      child: Card(

                        color: Colors.purple[100],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: <Widget>[
                                  //Image.asset("assets/settings.png",width: 64.0,),
                                IconButton(iconSize: 80,color: Colors.red[900],icon: Icon(Icons.thermostat),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Temp()));
                                  },
                                ),
                                SizedBox(
                                  height: 0.0,
                                ),
                                Text("Temperature",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10.0),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:130.0,
                      height: 116.0,
                      child: Card(
                        color: Colors.purple[100],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: <Widget>[
                                  //Image.asset("assets/settings.png",width: 64.0,),
                                IconButton(iconSize: 80,color: Colors.deepOrange,icon: Icon(FontAwesomeIcons.fan),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FanPage()));  //fan
                                  },
                                ),
                                SizedBox(
                                  height: 0.0,
                                ),
                                Text("Fan",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10.0),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),               
                    SizedBox(
                      width:130.0,
                      height: 116.0,
                      child: Card(
                        color: Colors.purple[100],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)  
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: <Widget>[
                                  //Image.asset("assets/settings.png",width: 64.0,),
                                IconButton(iconSize: 80,color: Colors.brown[900],icon:  Icon(Icons.logout),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));  //fan
                                  },
                                ),
                                  
                                SizedBox(
                                  height: 0.0,
                                ),
                                Text("Log out",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10.0),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
    
              ],
            ))
          ],
        ),
      ),
    );
  }
}