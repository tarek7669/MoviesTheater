import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ColorConsts.dart';
import '../../../ViewModel/Database/SharedPreferences.dart';
import '../../Pages/Login.dart';

Widget CustomDrawer(BuildContext context, Size size){
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
              minRadius: 25,
              child: Image.asset("assets/images/CircleAvatar.png"),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text("Liam Zak",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        DrawerListTile("Account", "accountDrawer.png", (){}),
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

        DrawerListTile("About", "aboutDrawer.png", (){}),

        DrawerListTile("Logout", "logoutDrawer.png", () {

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
          color: Colors.white
      ),
    ),
    leading: Image.asset("assets/icons/$image_path"),
    onTap: onTap,
  );
}