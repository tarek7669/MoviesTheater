import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ColorConsts.dart';
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
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
            Text("Movies",
              style: TextStyle(
                color: primaryColor,
                fontSize: 65
              ),
            ),
            Text("Theater",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35
              ),)
          ]
        ),
      )
    );
  }
}
