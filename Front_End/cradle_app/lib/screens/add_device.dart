import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:cradle_app/screens/select_device.dart';
class Add_devicePage extends StatefulWidget {
  @override
  _Add_deviceState createState() => _Add_deviceState();
}

class _Add_deviceState extends State<Add_devicePage> {

  String validatePassword(value){
    if(value.isEmpty){
      return "required *";
    }
    else{
      return null;
    }
  }

  String name;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //==
      appBar: AppBar(
        //elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.purple[100],
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
      ),
      //==
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
               CircleAvatar(
                  backgroundColor: Colors.white,
                  radius:70,
                  child: Image.asset("assets/images/DeviceID.png"),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Username"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      name = value;
                    },
                  ),
                ),
                
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    //controller: password,
                    //obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Device_ID"),
                    validator: validatePassword,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.purple[700],
                    onPressed: (){

                      if(_formkey.currentState.validate())
                      {
                        print("successful");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));

                       // return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black,width:2)
                        
                    ),
                    textColor:Colors.white,child: Text("Add"),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
