import 'package:flutter/material.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';


class MusicPage extends StatefulWidget {
  @override
  _Mstate createState() => _Mstate();
}


class _Mstate extends State<MusicPage>  {
  //bool isSwitched = false;
  //bool _value = false;
  //int val = -1;

  String dropdownvalue ;
  String check = "-1";
  var items =  ["Song 1","Song 2","Song 3"];

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
                        onPressed: () => print('play music'),
        
                       ),
        
                       IconButton(
                        iconSize: 65,
                        color: Colors.red[900],
                        icon: Icon(Icons.stop),
                        onPressed: () => print('off music'),
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


