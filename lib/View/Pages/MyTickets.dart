import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/ViewModel/Bloc/Tickets/ticket_cubit.dart';

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
      drawer: CustomDrawer(context, size),
      appBar: CustomAppBar(
          Text("My Tickets",
            style: TextStyle(
                color: Colors.white
            ),

          ), drawerKey
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Today's ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                  Text("tickets",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    ),
                  ),
                ],
              ),

              BlocProvider(
                create: (context) => TicketCubit()..getTickets(),
                child: BlocConsumer<TicketCubit, TicketState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    TicketCubit ticket = TicketCubit.get(context);
                    return ticket.ticketsModel.isEmpty ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                    : ListView.builder(
                        itemCount: ticket.ticketsModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Image.asset("assets/images/smallTicket.png"),
                          );
                        }
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
