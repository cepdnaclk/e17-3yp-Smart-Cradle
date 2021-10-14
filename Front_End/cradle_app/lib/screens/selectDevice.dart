import 'package:flutter/material.dart';
import 'package:cradle_app/screens/dashBoard.dart';


class Selectd extends StatefulWidget {
  @override
  _SelectdState createState() => _SelectdState();
}
class _SelectdState extends State<Selectd> {
  int dropdownvalue ;
  var items =  [001,002];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.purple[100],
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
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
                    Text("Select a Device",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    //SizedBox(height: 10,),
                 
                  ],
                ),
                              
               CircleAvatar(
                  backgroundColor: Colors.white,
                  radius:90,
                  child: Image.asset("assets/images/cradle.png"),
                ),
                SizedBox(
                  height: 10,

                ),

 
               
            Padding(
              padding:EdgeInsets.all(63.0),

              child: Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.purple[50],
              border: Border.all()),


              child: (
                DropdownButton(
                  value: dropdownvalue,
                  //icon: Icon(Icons.keyboard_arrow_down),
                  items:items.map((int items) {
                       return DropdownMenuItem <int>(
                           value: items,
                           child: Text(items.toString())
                       );
                  }
                  ).toList(),
                onChanged: (int newValue){
                  setState(() {
                    dropdownvalue = newValue;
                  });
                },
              hint:Text("Select Device ID",
              style: TextStyle(color: Colors.indigo[800],fontSize: 20, fontWeight: FontWeight.bold),),
              disabledHint:Text("Disabled"),
              //elevation: 80,
              style:TextStyle(color:Colors.purple[700], fontSize: 20,fontWeight: FontWeight.bold),
              icon: Icon(Icons.arrow_drop_down_circle),
              iconDisabledColor: Colors.red,
              iconEnabledColor: Colors.purple[700],
              isExpanded: true,
              dropdownColor: Colors.purple[50],
            
              
              )
            ),
          ),
            ),

            SizedBox(height:5,width: 200,),
                  MaterialButton(
                    minWidth: 150,
                   // height: 50,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardPage()));

                    },
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.black,width:2)
                    ),
                    child: Text(
                      "Select",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Want to add a new device?"),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0), //250
                      child: Row(
                        children:<Widget>[
                          TextButton(
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                              print("Add device");
                            },
                            child: Text("CLICK HERE"),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
    
              ],
            ))
          ],
        ),
      ),



    );
  }
}
