import 'package:flutter/material.dart';

import '../../../ColorConsts.dart';

Widget SearchTextField(){
  return TextField(

    style: TextStyle(color: textColor, ),
    decoration: InputDecoration(
      border: InputBorder.none,

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(41.0),
      ),

      enabledBorder: OutlineInputBorder(
        // borderSide:
        // BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(41.0),
      ),
      disabledBorder: OutlineInputBorder(
        // borderSide:
        // BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(41.0),
      ),
      filled: true,
      hintText: "Search",
      hintStyle: TextStyle(
          color: Color(0xFF707070)
      ),
      fillColor: Color(0xFF1C1C1C),

    ),
  );
}