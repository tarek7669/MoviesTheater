import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../Model/movies_model.dart';
import '../../../view_model/Bloc/Home/home_cubit.dart';

Widget AllMoviesCarousel(BuildContext context, HomeCubit movie){
  return Column(
    children: [
      CarouselSlider(
        carouselController: movie.carouselController,
        items: movie.upcomingMovies.map((index) {
          return Builder(
            builder: (context){
              return Container(
                width: 180,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Card(
                  child: Stack(
                    children: [
                      Image.network(index.imageUrl.toString(), fit: BoxFit.fill),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Expanded(
                          child: Text(index.name.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Salsa'
                            ),
                          ),
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
          height: 266.0,
          scrollPhysics: BouncingScrollPhysics(),
          // autoPlay: true,
          // autoPlayCurve: Curves.bounceInOut
          aspectRatio: 10,

        ),
      ),
      // DotsIndicator(
      //   dotsCount: movie.upcomingMovies.length,
      //   // position: movie.carouselController.,
      //   decorator: DotsDecorator(
      //     size: const Size.square(9.0),
      //     activeSize: const Size(18.0, 9.0),
      //     activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      //   ),
      // )
    ],
  );

  // return AnimatedBuilder(
  //   animation: pageController,
  //   builder: (BuildContext context, Widget? child) {
  //     double value = 0.0;
  //     if(pageController.position.haveDimensions){
  //       value = index.toDouble() - (pageController.page ?? 0);
  //       value = (value * 0.05).clamp(-1, 1);
  //     }
  //     return Transform.rotate(
  //       angle: pi * value,
  //       child: Image.network(movies[index].imageUrl.toString()),
  //     );
  //   },
  // );
}