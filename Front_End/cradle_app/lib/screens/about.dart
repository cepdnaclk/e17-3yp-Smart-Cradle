// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cradle_app/screens/login.dart';
import 'package:cradle_app/screens/signup.dart';



class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen
          color: Colors.white,  //add backgroud colour
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Smart Cradle",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,

                    ),
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Because you and baby deserve care! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,

                  ),)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home.jpg") //add  an image to welcome page
                  )
                ),
              ),

              Column(
                children: <Widget>[
                  
                  SizedBox(
                    height: 20,
                  ),
                  Text("Features available in This App ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,

                  ),)
                ],
              ),

              

              //////
            ],
          ),
        ),
      ),
    );
  }
}

