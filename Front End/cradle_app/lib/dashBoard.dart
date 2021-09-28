import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cradle_app/music.dart';
import 'package:cradle_app/temperature.dart';
import 'package:cradle_app/FanPage.dart';
import 'package:cradle_app/cradle.dart';
import 'package:cradle_app/vedio.dart';
import 'package:cradle_app/record.dart';

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
               
        // dash board without square
    
      /*        Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),   //shashini-200 //emu-100 //4n-Ha-80
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 80,
                        color: Colors.indigo[900],
                        icon: Icon(Icons.videocam),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> vedioPage())); //vediocam
                        },
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
                  padding: EdgeInsets.symmetric(horizontal: 80), //shashini -200
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 80,
                        color: Colors.green[900],
                        icon: Icon(Icons.crib),
                         onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Swing())); // cradle
                        },
        
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
                  padding: EdgeInsets.symmetric(horizontal: 130), //shashini -250 //emu-130
                  child: Row(
                    children:<Widget>[

                       IconButton(
                        iconSize: 80,
                        
                        color: Colors.deepOrange,
                        icon: Icon(FontAwesomeIcons.fan),
                         onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> FanPage()));  //fan
                        },
        
                       ),
        
                      
                     
                    ],
                  ),
                

                
                ),

    */


      /*          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu, color: Colors.white,size: 52.0,),
                  Image.asset("assets/image.png",width: 52.0,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Welcome, Doctor code \nSelect an option",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
            ),
         */
        
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
                              Text(
                                "Monitor",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0
                                ),
                              ),
                           /*   SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "2 Items",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100
                                ),
                              )
                           */
                           
                            ],
                            ),
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:110.0,
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
                                  IconButton(
                        iconSize: 80,
                        color: Colors.blue,
                        icon: Icon(Icons.music_note),
                        
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MusicPage()));
                        },
                      ),
                                  SizedBox(
                                    height: 0.0,
                                  ),
                                  Text(
                                    "Music",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0
                                    ),
                                  ),
                                /*  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "12 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )
                               */
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
                                  IconButton(
                        iconSize: 80,
                        color: Colors.green[900],
                        icon: Icon(Icons.crib),
                         onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Swing())); // cradle
                        },
        
                       ),
                                  SizedBox(
                                    height: 0.0,
                                  ),
                                  Text(
                                    "Swing",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0
                                    ),
                                  ),
                                  
                                 /* SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "4 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )
                                */
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:110.0,
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
                                IconButton(
                        iconSize: 80,
                        color: Colors.red[900],
                        icon: Icon(Icons.thermostat),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Temp()));
                        },
                      ),
                                  SizedBox(
                                    height: 0.0,
                                  ),
                                  Text(
                                    "Temperature",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0
                                    ),
                                  ),
                                 /*
                                 
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )
                                */
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
                                IconButton(
                        iconSize: 80,
                        
                        color: Colors.deepOrange,
                        icon: Icon(FontAwesomeIcons.fan),
                         onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> FanPage()));  //fan
                        },
        
                       ),
                                  SizedBox(
                                    height: 0.0,
                                  ),
                                  Text(
                                    "Fan",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0
                                    ),
                                  ),
                                 /*
                                 
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )
                                */
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                 
                                    
                    SizedBox(
                      width:110.0,
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
                                IconButton(
                        iconSize: 80,
                        
                        color: Colors.brown[900],
                        icon:  Icon(Icons.mic),
                         onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RecordPage()));  //fan
                        },
        
                       ),
                                  SizedBox(
                                    height: 0.0,
                                  ),
                                  Text(
                                    "Voice Message",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0
                                    ),
                                  ),
                                 /*
                                 
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )
                                */
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
