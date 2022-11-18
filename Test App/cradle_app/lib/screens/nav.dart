import 'package:cradle_app/main.dart';
import 'package:cradle_app/screens/about.dart';
import 'package:cradle_app/screens/add_device.dart';
import 'package:cradle_app/screens/login.dart';
import 'package:cradle_app/screens/select_device.dart';
import 'package:cradle_app/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:cradle_app/screens/music.dart';
import 'package:cradle_app/screens/temperature.dart';
import 'package:cradle_app/screens/FanPage.dart';
import 'package:cradle_app/screens/cradle.dart';
import 'package:cradle_app/screens/vedio.dart';
import 'package:cradle_app/screens/Remove_device.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        
        children: [


          UserAccountsDrawerHeader(
            arrowColor: Colors.purple,
            
            accountName: Text('Hi!'),
            accountEmail: Text('Welcome to Smart Cradle'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/signup2.jpeg',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),

            decoration: BoxDecoration(
              color: Colors.purple,
              
            ),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('My devices'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Selectd()));
            } ,
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add a Device'),
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_devicePage()));
            } ,
          ),
          ListTile(
            leading: Icon(Icons.crib),
            title: Text('Remove a Device'),
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Remove_devicePage()));
            } ,
          ),
          
          
         
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SETTINGPage()));
            } ,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About the App'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> about()));
            } ,
          ),
          Divider(),
          ListTile(
            title: Text('Log out'),
            leading: Icon(Icons.exit_to_app),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
            } ,
          ),
        ],
      ),
    );
  }
}