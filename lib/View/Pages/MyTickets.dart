import 'package:flutter/material.dart';

import '../../ColorConsts.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        title: Text("My Tickets",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
