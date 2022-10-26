import 'package:flutter/material.dart';

import '../../ColorConsts.dart';
import '../Components/Core/CustomAppBar.dart';
import '../Components/Core/Drawer.dart';

class MyTickets extends StatelessWidget {
  MyTickets({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: backColor,
      key: drawerKey,
      drawer: CustomDrawer(size),

      appBar: CustomAppBar(
        Text("My Tickets",
          style: TextStyle(
              color: Colors.white
          ),

        ),drawerKey
      )
    );
  }
}
