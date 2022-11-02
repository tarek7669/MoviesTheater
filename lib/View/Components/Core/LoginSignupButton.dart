import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/ColorConsts.dart';

Widget LoginSignupButton(Widget text, onPressed){
  return InkResponse(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.fromLTRB(57, 0, 51, 0),
      width: 252,
      height: 47,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        child: Center(
          child: text
          // Text(text,
          //   style: GoogleFonts.getFont('Roboto', color: textColor, fontSize: 13, fontWeight: FontWeight.w600)
          // ),
        ),
      ),
    ),
  );
}