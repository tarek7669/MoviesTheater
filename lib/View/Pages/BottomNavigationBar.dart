import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ColorConsts.dart';
import 'Home.dart';
import 'MyTickets.dart';
import 'Search.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List<Widget> screens = [
    Home(),
    MyTickets(),
    Search()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backColor,
        elevation: 0,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/Home.png",
                      color: _selectedIndex == 0 ? primaryColor : unselectedButton,
              ),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/Ticket.png",
                color: _selectedIndex == 1 ? primaryColor : unselectedButton,
              ),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                color: _selectedIndex == 2 ? primaryColor : unselectedButton,
              ),
              label: ""
          )
        ],
      ),
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
    );
  }
}
