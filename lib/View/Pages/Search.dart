import 'package:flutter/material.dart';

import '../../ColorConsts.dart';
import '../Components/Core/CustomAppBar.dart';
import '../Components/Core/Drawer.dart';
import '../Components/Search/SearchTextField.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
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
      appBar:  CustomAppBar(
        Text("Search",
          style: TextStyle(
              color: Colors.white
          ),
        ),drawerKey
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: SearchTextField(),
      ),
    );
  }
}
