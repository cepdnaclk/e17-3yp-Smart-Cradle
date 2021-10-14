import 'package:flutter/material.dart';

class SwingPage extends StatefulWidget {
  @override
  _Sstate createState() => _Sstate();
}


class _Sstate extends State<SwingPage>  {
  //bool isSwitched = false;
 // bool _value = false;
  //int val = -1;

  
  String dropdownvalue ;
  String check = "-1";
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
                    Text("Swing",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color:Colors.green[700]),),
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
               
               



              ],
            ))
          ],
        ),
      ),
    );
  }

}


