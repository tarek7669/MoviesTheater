import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../ColorConsts.dart';
import '../../../Model/UpcomingMoviesModel.dart';

Widget UpcomingMoviesCarousel(BuildContext context, List<UpcomingMoviesModel> upcomingMovies){
  return CarouselSlider(

    items: upcomingMovies.map((index) {

      return Builder(
        builder: (context){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: backColor
            ),
            child: Card(
              color: backColor,
              child: Container(
                decoration: BoxDecoration(
                  color: backColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: NetworkImage(index.imageUrl.toString()),
                    fit: BoxFit.fill,
                  )
                ),
                child: Center(
                  child: Icon(Icons.play_circle_outline_rounded, color: Colors.white, size: 60,),
                ),
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