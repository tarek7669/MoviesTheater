import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_theater/ViewModel/Database/SharedPreferences.dart';

import '../../ColorConsts.dart';
import '../../Constants.dart';
import 'BottomNavigationBar.dart';
import 'Home.dart';
import 'Login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}



class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 4),
      () {
        SharedPref.getToken("token").then((value) {
          if (value != '' && value != null && value.isNotEmpty) {
            Token = value;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
          }else{

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
          }
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Stars",
            //   style: TextStyle(
            //     color: primaryColor,
            //     fontSize: 65,
            //     fontFamily: 'Salsa'
            //   ),
            // ),
            Image.asset("assets/images/stars.png"),
            Text("Theater",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'Salsa'
              ),)
          ]
        ),
      )
    );
  }
}
