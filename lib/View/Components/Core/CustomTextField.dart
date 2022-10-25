import 'package:flutter/material.dart';

Widget customTextField(String hint, controller){
  return TextField(
    controller: controller,
    decoration: InputDecoration(

      enabledBorder: OutlineInputBorder(
        // borderSide:
        // BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      disabledBorder: OutlineInputBorder(
        // borderSide:
        // BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey[500]
      ),
      fillColor: Colors.grey[800],

    ),
  );
}