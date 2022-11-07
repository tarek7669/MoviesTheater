import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_consts.dart';
import '../../model/reservation_model.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        toolbarHeight: 81,
        backgroundColor: backColor,
        centerTitle: true,
        elevation: 0,
        title: Text("Checkout",
          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      bottomNavigationBar: InkResponse(
        onTap: (){},
        child: Container(
          height: 75,
          color: primaryColor,
          child: Center(
              child: Text("Pay Now",
                style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
              )
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          width: size.width * 0.7,
            height: 1,
            color: primaryColor,
          ),
          Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(73, 23, 73, 15),
                    child: Text(ReservationModel.movie_name.toString(),
                      style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 0, 100, 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if(ReservationModel.is_today)
                          Text("Today | ",
                            style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                        if(ReservationModel.is_tommorrow)
                          Text("Tommorrow | ",
                            style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                          ),

                        Text("${ReservationModel.day} ${ReservationModel.month}",
                          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                        ),

                        Text(" | ",
                          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        Text("${ReservationModel.time}",
                          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(31, 0, 31, 15),
                    padding: EdgeInsets.only(top: 20, left: 17),
                    width: size.width,
                    height: size.height * 0.35,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0xFF171717)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("NP Order",
                                  style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                width: size.width* 0.4,
                                height: 2,
                                color: backColor,
                              ),
                              Text("Info",
                                style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                width: size.width* 0.5,
                                height: 2,
                                color: backColor,
                              ),
                              Text("Session",
                                style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                width: size.width* 0.5,
                                height: 2,
                                color: backColor,
                              ),
                              Text("Seats",
                                style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                width: size.width* 0.5,
                                height: 2,
                                color: backColor,
                              ),
                              Text("Total",
                                style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("7283603745",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              width: size.width* 0.35,
                              height: 2,
                              color: backColor,
                            ),
                            Text("${ReservationModel.movie_name}",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              width: size.width* 0.35,
                              height: 2,
                              color: backColor,
                            ),
                            Text("${ReservationModel.time}, ${ReservationModel.day} ${ReservationModel.month}",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              width: size.width* 0.35,
                              height: 2,
                              color: backColor,
                            ),
                            Text(ReservationModel.reserved_seats.toString().split("[")[1].split("]")[0],
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              width: size.width* 0.35,
                              height: 2,
                              color: backColor,
                            ),
                            Text("${ReservationModel.pay_sum} EGP",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}
