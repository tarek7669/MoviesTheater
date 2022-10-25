import 'package:flutter/material.dart';
import 'package:movies_theater/ColorConsts.dart';

Widget LoginSignupButton(String text, onPressed){
  return Container(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    width: double.infinity,
    height: 60,
    child: ElevatedButton(

      style: ElevatedButton.styleFrom(
      primary: primaryColor,
      ),
      onPressed: onPressed,
      child: Text(text,
        style: TextStyle(
          fontSize: 20
        ),
      )
    ),
  );
}