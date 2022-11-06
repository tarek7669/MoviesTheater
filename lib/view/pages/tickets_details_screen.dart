import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/constants/color_consts.dart';

import '../Components/Core/custom_appbar.dart';

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
          style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w700, fontSize: 20),
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
                          style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name",
                              style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                            ),
                            SizedBox(height: 10),
                            Text("Ahmed Abaza",
                              style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                            SizedBox(height: 25,),

                            Text("Date",
                              style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                            ),
                            SizedBox(height: 10),
                            Text("20 Feb 2022",
                              style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                            SizedBox(height: 25,),

                            Text("NP Order",
                              style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                            ),
                            SizedBox(height: 10),
                            Text("7283603745",
                              style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Seats",
                              style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                            ),
                            SizedBox(height: 10),
                            Text("G5, G6, G7, G8",
                              style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                            SizedBox(height: 25,),

                            Text("Time",
                              style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                            ),
                            SizedBox(height: 10),
                            Text("9:00 pm",
                              style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                            SizedBox(height: 25,),

                            Text("Price",
                              style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                            ),
                            SizedBox(height: 10),
                            Text("150 EGP",
                              style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         Text("Name",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                    //         ),
                    //         Text("Ahmed Abaza",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                    //         )
                    //       ],
                    //     ),Column(
                    //       children: [
                    //         Text("Seats",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                    //         ),
                    //         Text("G5, G6, G7, G8",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                    //         )
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    //
                    // SizedBox(height: size.height * 0.04),
                    //
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         Text("Date",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                    //         ),
                    //         Text("20 Feb 2022",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                    //         )
                    //       ],
                    //     ),Column(
                    //       children: [
                    //         Text("Time",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                    //         ),
                    //         Text("9:00 pm",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                    //         )
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    //
                    // SizedBox(height: size.height * 0.04),
                    //
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         Text("NP Order",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                    //         ),
                    //         Text("7283603745",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                    //         )
                    //       ],
                    //     ),Column(
                    //       children: [
                    //         Text("Price",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.46), fontWeight: FontWeight.w400, fontSize: 9),
                    //         ),
                    //         Text("150 EGP",
                    //           style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
                    //         )
                    //       ],
                    //     ),
                    //   ],
                    // ),

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
