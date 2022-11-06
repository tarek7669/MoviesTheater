import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/constants/color_consts.dart';

import '../../view_model/Bloc/movie_reservation/reservation_cubit.dart';
import 'checkout_screen.dart';

class ReservationScreen extends StatelessWidget {
  String movie_name;
  ReservationScreen(this.movie_name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backColor,
      bottomNavigationBar: InkResponse(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
        },
        child: Container(
          height: 75,
          color: primaryColor,
          child: Center(
              child: Text("Checkout",
                style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
              )
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 81,
        backgroundColor: backColor,
        centerTitle: true,
        elevation: 0,
        title: Text("Reservation",
          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.5,
            height: 1,
            color: primaryColor,
          ),

          BlocProvider(
            create: (context) => ReservationCubit(),
            child: Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(31.5, 24, 31.5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(movie_name,
                      style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    BlocConsumer<ReservationCubit, ReservationState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        ReservationCubit reserve_cubit = ReservationCubit.get(context);
                        return Container(
                          padding: EdgeInsets.only(top: 24),
                          child: Swiper(
                            layout: SwiperLayout.CUSTOM,
                            onIndexChanged: (index){
                              reserve_cubit.TimeSelected(index);
                            },
                            customLayoutOption: CustomLayoutOption(
                                startIndex: 1,
                                stateCount: 3
                            )..addRotate([
                              // -45.0/180,
                              0.0,
                              0.0,
                              0.0,
                              // 45.0/180
                            ])..addTranslate([
                              Offset(-100.0, 10.0),
                              Offset(0.0, 0.0),
                              Offset(100.0, 10.0)
                            ]),
                            itemWidth: 70.0,
                            itemHeight: 50.0,
                            fade: 0.5,
                            loop: true,
                            // pagination: SwiperPagination(),
                            itemBuilder: (context, index) {
                              return Container(
                                // color: Colors.red,
                                child: Column(
                                  children: [
                                    Text(reserve_cubit.screen_time[index],
                                      style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16),
                                    ),
                                    // if(reserve_cubit.getTimeSelected() == index)
                                    //   SvgPicture.asset("assets/images/dot.svg")
                                  ],
                                ),
                              );
                            },
                            itemCount: reserve_cubit.screen_time.length,
                          ),
                        );
                      },
                    ),

                    SvgPicture.asset("assets/images/reservationScreen.svg"),

                    // Container(
                    //   height: size.height * 0.5,
                    //   width: size.width,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.vertical,
                    //     itemCount: 7,
                    //     itemBuilder: (context, i){
                    //       return ListView.builder(
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: i % 2 == 0 ? 8 : 9,
                    //         itemBuilder: (BuildContext context, int j){
                    //           // return SvgPicture.asset("assets/images/avalaible_seat.svg");
                    //           return Container(
                    //             color: Colors.grey,
                    //             width:40,
                    //             height: 40,
                    //           );
                    //         }
                    //       );
                    //     }
                    //   ),
                    // ),

                    BlocConsumer<ReservationCubit, ReservationState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        ReservationCubit reserve = ReservationCubit.get(context);
                        return Container(
                          height: size.height * 0.4,
                          // color: Colors.red,
                          child: ListView.builder(
                            itemCount: 7,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                // color: Colors.red,
                                width: size.width,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListView.builder(
                                        itemCount: i % 2 == 0 ? 8 : 9,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context,int j) {
                                          return reserve.SelectSeat(i, size, j,
                                            reserve.seats.contains(reserve.selected) ?
                                                "assets/images/selected_seat.svg"
                                                : "assets/images/avalaible_seat.svg"
                                          );
                                        }),
                                  ],
                                ),
                              );
                            },
                          )
                        );
                      },
                    ),

                    SizedBox(height: 60,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/reserved_seat.svg", width: 16, height: 13,),
                            SizedBox(width: 9),
                            Text("Reserved Seats",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/avalaible_seat.svg", width: 16, height: 13,),
                            SizedBox(width: 9),
                            Text("Available Seats",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/selected_seat.svg", width: 16, height: 13,),
                            SizedBox(width: 9),
                            Text("Selected Seats",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),
                            )
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 60,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/money.svg", width: 26, height: 22,),
                            SizedBox(width: 6,),
                            Text("150 EGP",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                            )
                          ],
                        ),

                        SvgPicture.asset("assets/images/dot.svg", width: 6, height: 6, color: Colors.white,),

                        Row(
                          children: [
                            Text("4 seats selected",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                            )
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
