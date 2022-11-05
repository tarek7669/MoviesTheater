import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/ColorConsts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Model/UpcomingMoviesModel.dart';

class MovieDetails extends StatelessWidget {
  UpcomingMoviesModel movie;

  MovieDetails(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backColor,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movie.imageUrl.toString()),
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
                        child: Text(movie.name.toString(),
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
                        movie.adult == true ? Text("PG-18",
                          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                        )
                            : Text("PG-3",
                              style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                            ),

                        SizedBox(width: 8,),
                        SvgPicture.asset("assets/images/dot.svg", width: 4.7, height: 4.7,),

                        SizedBox(width: 8,),
                        Text(calcTime(movie.duration!),
                          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        SizedBox(width: 8,),
                        SvgPicture.asset("assets/images/dot.svg", width: 4.7, height: 4.7,),

                        SizedBox(width: 8,),
                        Text(movie.genre.toString().replaceAll(", ", " | "),
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
                  rating: movie.rating as double,
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
                  child: Text(movie.rating.toString(),
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
            child: Text(movie.overview.toString(),
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
            padding: EdgeInsets.fromLTRB(27, 0, 18, 0),
            height: 66,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index){

                return Container(
                  padding: EdgeInsets.only(right: 20),
                  width: 57,
                  height: 66,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  String calcTime(num minutes){
    int hrs = (int.parse(minutes.toString()) / 60).floor();
    num min = minutes % 60;

    String duration = hrs.toString() + "h : " + min.toString() + "m";
    debugPrint("\n\n\n duration ---> " + duration + "\n\n\n");
    debugPrint("\n\n\n rating ---> " + movie.rating.toString() + "\n\n\n");
    return duration.toString();
  }

}
