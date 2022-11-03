import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ColorConsts.dart';
import '../../../ViewModel/Database/SharedPreferences.dart';
import '../../Pages/Login.dart';

Widget CustomDrawer(BuildContext context, Size size){
  return Container(
    width: (size.width / 3) * 2,
    // width: 231,
    color: Color(0xFF121212),

    padding: EdgeInsets.fromLTRB(29, 40, 40, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              minRadius: 25,
              child: Image.asset("assets/images/CircleAvatar.png"),
            ),
            SizedBox(width: 23),
            Expanded(
              child: Text("Liam Zak",
                style: GoogleFonts.getFont('Roboto', color: textColor, fontSize: 19, fontWeight: FontWeight.w700)
              ),
            ),
          ],
        ),
        SizedBox(height: 43),
        DrawerListTile("Account", "account.svg", (){}),

        DrawerListTile("Settings", "setting.svg", (){}),

        DrawerListTile("About", "about.svg", (){}),

        DrawerListTile("Logout", "logout.svg", () {

          SharedPref.deleteAll().then((value) {
            if(value)
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            else
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Something went wrong in logout"),
              ));
          });
        }),
      ],
    ),
  );
}

Widget DrawerListTile(String title, String image_path, onTap){
  return ListTile(
    title: Text(title,
      style: TextStyle(
          color: Colors.white,
        fontSize: 14
      ),
    ),
    leading: SvgPicture.asset("assets/icons/$image_path"),
    onTap: onTap,
  );
}