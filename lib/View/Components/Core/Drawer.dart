import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ColorConsts.dart';

Widget CustomDrawer(Size size){
  return Container(
    width: (size.width / 3) * 2,
    color: Colors.grey[900],

    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              minRadius: 35,
              child: Image.asset("assets/images/CircleAvatar.png"),
            ),
            SizedBox(width: 10),
            Text("Liam Zak",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        DrawerListTile("Account", "accountDrawer.png"),
        ListTile(
          title: Text('Settings',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          leading: Icon(CupertinoIcons.settings,
            color: primaryColor,
          ),
        ),

        DrawerListTile("About", "aboutDrawer.png"),

        DrawerListTile("Logout", "logoutDrawer.png"),
      ],
    ),
  );
}

Widget DrawerListTile(String title, String image_path){
  return ListTile(
    title: Text(title,
      style: TextStyle(
          color: Colors.white
      ),
    ),
    leading: Image.asset("assets/icons/$image_path"),
  );
}