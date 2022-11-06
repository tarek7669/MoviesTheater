import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/constants/color_consts.dart';

import '../../../view_model/Bloc/movie_details/movie_cubit.dart';

Widget SelectTime(BuildContext context) {
  return BlocProvider(
    create: (context) => MovieCubit(),
    child: BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MovieCubit movie = MovieCubit.get(context);
        return Container(
            height: 70,
            width: double.infinity,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                viewportFraction: 0.2,
                aspectRatio: 1.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                initialPage: 2,
                autoPlay: false,
              ),
              itemCount: 10,
              itemBuilder: (context, index, realidx) {
                return InkResponse(
                  onTap: (){
                    movie.MovieDaySelected(index);
                  },
                  child: Container(
                    height: 62,
                    width: 52,
                    padding: EdgeInsets.only(top: 10, bottom: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: movie.getDaySelected() == index ? primaryColor : Color(0xFF171717),
                    ),
                    child: Column(
                      children: [
                        Text((movie.getDate().day + index - 2).toString(),
                          style: GoogleFonts.getFont(
                              'Roboto', color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 23),
                        ),
                        SizedBox(height: 2),
                        Text(movie.months[movie.getDate().month],
                          style: GoogleFonts.getFont(
                              'Roboto', color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
        );
      },
    ),
  );

  // return Container(
  //   height: 62,
  //   width: double.infinity,
  //   child: ListView.builder(
  //     itemCount: 10,
  //     scrollDirection: Axis.horizontal,
  //     itemBuilder: (context, index){
  //       return Container(
  //         height: 30,
  //         width: 52,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(6)),
  //           color: Colors.grey,
  //         ),
  //         child: Column(
  //           children: [
  //             Text(,
  //               style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23),
  //             ),
  //             Text('f',
  //               style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   ),
  // );
}