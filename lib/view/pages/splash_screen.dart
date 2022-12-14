import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_theater/view_model/Database/SharedPreferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_consts.dart';
import '../../constants/constants.dart';
import 'bottom_nav_bar_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

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
            Image.asset("assets/images/stars.png", width: 160, height: 122,),
            Text("Theater",
              style: GoogleFonts.getFont('Salsa', color: textColor, fontSize: 25, fontWeight: FontWeight.w400),
            )
          ]
        ),
      )
    );
  }
}
