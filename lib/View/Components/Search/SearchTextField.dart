import 'package:flutter/material.dart';

Widget SearchTextField(){
  return TextField(
    decoration: InputDecoration(
      border: InputBorder.none,

      enabledBorder: OutlineInputBorder(
        // borderSide:
        // BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(30.0),
      ),
      disabledBorder: OutlineInputBorder(
        // borderSide:
        // BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(30.0),
      ),
      filled: true,
      hintText: "Search",
      hintStyle: TextStyle(
          color: Colors.grey[500]
      ),
      fillColor: Colors.grey[800],

    ),
  );
}