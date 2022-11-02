import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ColorConsts.dart';
import '../../../Model/UpcomingMoviesModel.dart';

Widget UpcomingMoviesCarousel(BuildContext context, List<UpcomingMoviesModel> upcomingMovies){
  return CarouselSlider(

    items: upcomingMovies.map((index) {

      return Builder(
        builder: (context){
          return Container(
            width: 300,
            height: 179,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: backColor
            ),
            child: Card(
              color: backColor,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage(index.imageUrl.toString()),
                        fit: BoxFit.fill,
                      )
                    ),
                    // child: Center(
                    //   child: CircleAvatar(backgroundColor: Color(0xFF161616),
                    //     child: Icon(Icons.play_arrow_rounded, color: textColor,),
                    //   )
                    // ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            backColor.withOpacity(0.1),
                            backColor.withOpacity(0.9),
                          ],
                          stops: [
                            0.0,
                            1.0
                          ]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: CircleAvatar(backgroundColor: Color(0xFF161616),
                          child: Icon(Icons.play_arrow_rounded, color: textColor,),
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 117, 0, 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(index.name.toString(),
                          style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w700, fontSize: 12),
                        ),
                        Text("April 1 2022",
                          style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.67), fontWeight: FontWeight.w700, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }).toList(),
    options: CarouselOptions(
      enlargeCenterPage: true,
      height: 200.0,
      scrollPhysics: BouncingScrollPhysics(),
    ),
  );
}