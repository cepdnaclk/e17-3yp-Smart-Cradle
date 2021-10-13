import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cradle_app/screens/dashBoard.dart';
/*class SelectDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    //==
    void _showToast(BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Wrong Input'),
          //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }
    //==
    bool _value = false;
    int val = -1;
    TextEditingController password = TextEditingController();
    TextEditingController confirmpassword = TextEditingController();

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    String name;
    @override
    Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
            title: Text('Select Your Device'),
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            leading: IconButton(
            onPressed: () {Navigator.pop(contex);},
            icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
      ),
      
      body: Center(
            child:SingleChildScrollView(
                child:Form(
                    child:Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
                    Column(
                    children: <Widget>[
                    Text(
                        "",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        ),
                    ),
                    ],
                ),
                    Column(
                        children: <Widget>[
                            Text(
                                "Select Your Device",
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                ),
                            ),
                        ],
                    ),
                Column(
                    children: <Widget>[
                    Text(
                        "",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        ),
                    ),
                    ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius:80,
                  child: Image.asset("assets/images/cradle.png"),
                ),
                ListTile(
                    title: Text("Device_ID_001"),
                    leading: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                        setState(() {
                        val = value;
                        print(val);
                        });
                    },
                    activeColor: Colors.blue,
                    ),
                ),
                ListTile(
                    title: Text("Device_ID_002"),
                    leading: Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                        setState(() {
                        val = value;
                        print(val);
                        });
                    },
                    activeColor: Colors.blue,
                    ),
                ),
                ListTile(
                    title: Text("Device_ID_003"),
                    leading: Radio(
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                        setState(() {
                        val = value;
                        print(val);
                        });
                    },
                    activeColor: Colors.blue,
                    ),
                ),
                ListTile(
                    title: Text("Device_ID_004"),
                    leading: Radio(
                    value: 4,
                    groupValue: val,
                    onChanged: (value) {
                        setState(() {
                        val = value;
                        print(val);
                        });
                    },
                    activeColor: Colors.blue,
                    ),
                ),
                //==
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.purple[700],
                    onPressed: (){
                        if(val!=(-1))
                      {
                        print("successful");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardPage()));
                      }
                      else{
                        print("UnSuccessfull");
                        _showToast(context);
                        
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black,width:2)
                        
                    ),
                    textColor:Colors.white,child: Text("SUBMIT"),

                  ),
                ),
                //==
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
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
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
            ),
            ),
            ),
          ),
    );
  }
}
