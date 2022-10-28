import 'package:flutter/material.dart';
import 'package:movies_theater/ColorConsts.dart';

import '../Components/Core/CustomAppBar.dart';

class TicketDetails extends StatelessWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: backColor,
        elevation: 0,
        title: Text("View Ticket",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: InkResponse(
          onTap: () {Navigator.pop(context);},
          child: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: size.width,
          height: size.height * 0.6,
          // color: Colors.red,
          child: Stack(
            children: [
              Image.asset("assets/images/bigTicket.png", fit: BoxFit.fill, width: size.width, height: size.height * 0.6,),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Movie: Spiderman No Way Home",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Name",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15
                              ),
                            ),
                            Text("Ahmed Abaza",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            )
                          ],
                        ),Column(
                          children: [
                            Text("Seats",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15
                              ),
                            ),
                            Text("G5, G6, G7, G8",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Date",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15
                              ),
                            ),
                            Text("20 Feb 2022",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            )
                          ],
                        ),Column(
                          children: [
                            Text("Time",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15
                              ),
                            ),
                            Text("9:00 pm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("NP Order",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15
                              ),
                            ),
                            Text("7283603745",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            )
                          ],
                        ),Column(
                          children: [
                            Text("Price",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15
                              ),
                            ),
                            Text("150 EGP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Image.asset("assets/images/ticketQRCode.png")),
              ),
            ]
          )
        )
      ),
    );
  }
}
