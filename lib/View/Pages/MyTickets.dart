import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/ViewModel/Bloc/Tickets/ticket_cubit.dart';

import '../../ColorConsts.dart';
import '../Components/Core/CustomAppBar.dart';
import '../Components/Core/Drawer.dart';
import 'TicketDetails.dart';

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
          physics: BouncingScrollPhysics(),
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

              // BlocProvider(
              //   create: (context) => TicketCubit()..getTickets(),
              //   child: BlocConsumer<TicketCubit, TicketState>(
              //     listener: (context, state) {
              //       // TODO: implement listener
              //     },
              //     builder: (context, state) {
              //       TicketCubit ticket = TicketCubit.get(context);
              //       return ticket.ticketsModel.isEmpty ? Center(
              //         child: CircularProgressIndicator(
              //           color: primaryColor,
              //         ),
              //       )
              //       : ListView.builder(
              //           itemCount: ticket.ticketsModel.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             return Container(
              //               child: Image.asset("assets/images/smallTicket.png"),
              //             );
              //           }
              //       );
              //     },
              //   ),
              // ),


              SizedBox(height: size.height / 20,),

              Container(
                width: size.width,
                height: 200,
                color: backColor,
                // decoration: BoxDecoration(
                //     color: ticketColor,
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //     image: DecorationImage(
                //
                //       image: AssetImage("assets/images/smallTicket.png",),
                //       fit: BoxFit.fill,
                //     )
                // ),
                child: Stack(
                  children: [
                    Image.asset("assets/images/smallTicket.png", color: ticketColor, width: size.width, height: 300,fit: BoxFit.fill,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                          height: size.height * 0.7,
                          child: Image.asset("assets/images/spiderman.png",fit: BoxFit.fill),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 30, 0, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Spider-man No Way Home",
                                style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.watch_later_outlined, color: Colors.white, size: size.width * 0.04,),
                                  Text("  9:00pm | 20 Februray",
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.event_seat, color: Colors.white, size: size.width * 0.04,),
                                  Text("  4 seats",
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                              InkResponse(
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => TicketDetails()));
                                },
                                child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text("View Ticket",
                                      style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Text("Upcoming ",
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

              SizedBox(height: size.height / 20,),

              Container(
                width: size.width,
                height: 200,
                color: backColor,
                // decoration: BoxDecoration(
                //     color: ticketColor,
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //     image: DecorationImage(
                //
                //       image: AssetImage("assets/images/smallTicket.png",),
                //       fit: BoxFit.fill,
                //     )
                // ),
                child: Stack(
                  children: [
                    Image.asset("assets/images/smallTicket.png", color: ticketColor, width: size.width, height: 300,fit: BoxFit.fill,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                          height: size.height * 0.7,
                          child: Image.asset("assets/images/Encanto.png",fit: BoxFit.fill),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 30, 0, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Encanto",
                                style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.watch_later_outlined, color: Colors.white, size: size.width * 0.04,),
                                  Text("  9:00pm | 20 Februray",
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.event_seat, color: Colors.white, size: size.width * 0.04,),
                                  Text("  4 seats",
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text("View Ticket",
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height / 20,),

              Container(
                width: size.width,
                height: 200,
                color: backColor,
                // decoration: BoxDecoration(
                //     color: ticketColor,
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //     image: DecorationImage(
                //
                //       image: AssetImage("assets/images/smallTicket.png",),
                //       fit: BoxFit.fill,
                //     )
                // ),
                child: Stack(
                  children: [
                    Image.asset("assets/images/smallTicket.png", color: ticketColor, width: size.width, height: 300,fit: BoxFit.fill,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                          height: size.height * 0.7,
                          child: Image.asset("assets/images/uncharted.png",fit: BoxFit.fill),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 30, 0, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Uncharted",
                                style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.watch_later_outlined, color: Colors.white, size: size.width * 0.04,),
                                  Text("  9:00pm | 20 Februray",
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.event_seat, color: Colors.white, size: size.width * 0.04,),
                                  Text("  4 seats",
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text("View Ticket",
                                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.03),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
