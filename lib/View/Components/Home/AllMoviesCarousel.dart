import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../Model/MoviesModel.dart';

Widget AllMoviesCarousel(BuildContext context, List<MoviesModel> movies){
  return CarouselSlider(
    items: movies.map((index) {
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
                          fontSize: 20
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
  );
}