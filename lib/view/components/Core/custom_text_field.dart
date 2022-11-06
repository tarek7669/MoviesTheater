import 'package:flutter/material.dart';

import '../../../constants/color_consts.dart';

Widget customTextField(String hint, controller){
  return TextField(

    style: TextStyle(color: textColor, ),

    controller: controller,
    decoration: InputDecoration(

      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(

          borderSide: BorderSide.none,
        // BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        // BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintText: hint,

      hintStyle: TextStyle(
        color: Color(0xFF707070)
      ),
      fillColor: Color(0xFF1C1C1C),

    ),
  );
}