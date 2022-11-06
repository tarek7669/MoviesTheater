import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/View/Components/Core/custom_appbar.dart';

import '../../constants/color_consts.dart';
import '../Components/Core/drawer.dart';
import 'home_screen.dart';
import 'my_tickets_screen.dart';
import 'search_screen.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);



  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  List<Widget> screens = [
    Home(),
    MyTickets(),
    Search()
  ];
  List<Widget> titles = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 70,
            height: 50,
            child: Image.asset("assets/images/stars.png", width: 65, height: 50,)
        ),
        Text("Theater",
            style: GoogleFonts.getFont('Salsa', fontSize: 9, color: textColor, fontWeight: FontWeight.w400)
        )
      ],
    ),

    Text("My Tickets",
      style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w700, fontSize: 20),
    ),

    Text("Search",
      style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w700, fontSize: 20),
    ),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: drawerKey,
      drawer: CustomDrawer(context, size),
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
              icon: SvgPicture.asset("assets/icons/search.svg",
                color: _selectedIndex == 2 ? primaryColor : unselectedButton,
              ),
              label: ""
          )
        ],
      ),
      appBar: CustomAppBar(titles.elementAt(_selectedIndex), drawerKey),
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
    );
  }
}
