import 'package:flutter/material.dart';

import '../../../ColorConsts.dart';

AppBar CustomAppBar(Widget title, GlobalKey<ScaffoldState> drawerKey){
  return AppBar(
    backgroundColor: backColor,
    title: title,
    centerTitle: true,
    leading: InkResponse(
        onTap: () {
          drawerKey.currentState!.openDrawer();
        },
        child: Image.asset("assets/icons/drawerIcon.png")
    ),
  );
}