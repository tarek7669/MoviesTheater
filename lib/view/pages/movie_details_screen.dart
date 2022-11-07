import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/constants/color_consts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_theater/View/Pages/reservation_screen.dart';
import '../../Model/upcoming_movies_model.dart';
import '../../view_model/Bloc/movie_details/movie_cubit.dart';
import '../Components/MovieDetails/select_time.dart';

class MovieDetails extends StatelessWidget {
  UpcomingMoviesModel upcoming_movie;

  MovieDetails(this.upcoming_movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => MovieCubit()..init(),
      child: Scaffold(
        bottomNavigationBar: InkResponse(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationScreen(upcoming_movie.name.toString())));
          },
          child: Container(
            height: 75,
            color: primaryColor,
            child: Center(
              child: Text("Reservation",
                style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
              )
            ),
          ),
        ),
        backgroundColor: backColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(upcoming_movie.imageUrl.toString()),
                    fit: BoxFit.fill,
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          backColor.withOpacity(0.0),
                          backColor.withOpacity(1),
                        ],
                        stops: [
                          0.0,
                          1.0
                        ]),
                  ),
                  child: Stack(
                    children: [
                      InkResponse(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            padding: EdgeInsets.fromLTRB(size.width * 0.04, size.height * 0.05, 0, 0),
                            child: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 35,)
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          height: size.height * 0.04,
                          // width: size.width,
                          child: Container(
                            child: Text(upcoming_movie.name.toString(),
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 21)
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            upcoming_movie.adult == true ? Text("PG-18",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                            )
                                : Text("PG-3",
                                  style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                                ),

                            SizedBox(width: 8,),
                            SvgPicture.asset("assets/images/dot.svg", width: 4.7, height: 4.7,),

                            SizedBox(width: 8,),
                            BlocConsumer<MovieCubit, MovieState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                                builder: (context, state) {
                                    MovieCubit movie = MovieCubit.get(context);
                                    return Text(movie.calcTime(upcoming_movie.duration!),
                                      style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                                );
                              },
                            ),
                            SizedBox(width: 8,),
                            SvgPicture.asset("assets/images/dot.svg", width: 4.7, height: 4.7,),

                            SizedBox(width: 8,),
                            Text(upcoming_movie.genre.toString().replaceAll(", ", " | "),
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(backgroundColor: Color(0xFF161616).withOpacity(0.7),minRadius: 5,maxRadius: 25,
                            child: Icon(Icons.play_arrow_rounded, color: textColor,),
                          )
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 13.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBarIndicator(
                      rating: upcoming_movie.rating as double,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: primaryColor,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(upcoming_movie.rating.toString(),
                        style: GoogleFonts.getFont('Roboto', color: primaryColor, fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(21, 23, 0, 0),
                child: Text("Synopsis",
                  style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 15, 33, 0),
                child: Text(upcoming_movie.overview.toString(),
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(18, 25, 31, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cast & Crew",
                      style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text("See All",
                          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                        Icon(Icons.keyboard_double_arrow_right_rounded,
                          color: primaryColor,
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 25,),

              Container(
                // padding: EdgeInsets.fromLTRB(27, 0, 18, 0),
                height: 80,
                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index){

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 57,
                          height: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          (index + 1).toString(),
                          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 8),
                        ),
                      ],
                    );
                  }
                ),
              ),

              SizedBox(height: 15,),

              Container(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 24, bottom: 35),
                      child: Text("Select Date",
                        style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ),

                    SelectTime(context),

                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
