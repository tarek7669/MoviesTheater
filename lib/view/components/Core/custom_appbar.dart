import 'package:flutter/material.dart';

import '../../../constants/color_consts.dart';


AppBar CustomAppBar(Widget title, GlobalKey<ScaffoldState> drawerKey){
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    backgroundColor: backColor,
    title: title,
    centerTitle: true,
    leading: InkResponse(
        onTap: () {
          drawerKey.currentState!.openDrawer();
        },
        child: Image.asset("assets/icons/drawerIcon.png", height: 15, width: 21,)
    ),
  );
}