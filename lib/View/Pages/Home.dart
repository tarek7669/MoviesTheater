// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/ColorConsts.dart';
import 'package:movies_theater/View/Components/Core/CustomAppBar.dart';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import '../../ViewModel/Bloc/Home/home_cubit.dart';
import '../Components/Core/Drawer.dart';
import '../Components/Home/AllMoviesCarousel.dart';
import '../Components/Home/UpcomingMoviesCarousel.dart';
import 'MovieDetails.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  List<String> images = [
    "assets/images/spiderman.png",
    "assets/images/uncharted.png",
    "assets/images/Encanto.png"
  ];
  List<String> names = [
    "Spiderman",
    "Uncharted",
    "Encanto"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      key: drawerKey,
      drawer: CustomDrawer(context, size),
      backgroundColor: backColor,

      appBar: CustomAppBar(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 50,
                child: Image.asset("assets/images/stars.png")
              ),
              Text("Theater",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Salsa'
                ),
              )
            ],
          ), drawerKey),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Column(
                  children: [
                    Text("Now Playing",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: 'Salsa'
                      ),
                    ),
                    Text("Book Your Ticket Now",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontFamily: 'Salsa'
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 50),

            //TEST UNTIL SERVER IS BACK
            // Container(
            //   height: 280,
            //   width: 180,
            //   child: CarouselSlider.builder(
            //
            //       // key: _sliderKey,
            //       unlimitedMode: true,
            //       slideBuilder: (index) {
            //         return InkResponse(
            //           onTap: () {
            //             Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails()));
            //           },
            //           child: Container(
            //             width: 180,
            //             height: 280,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(Radius.circular(40))
            //             ),
            //             child: Card(
            //               child: Stack(
            //                 children: [
            //                   Image.asset(images[index], fit: BoxFit.fill, width: 180, height: 280,),
            //                   Align(
            //                     alignment: Alignment.bottomCenter,
            //                     child: Expanded(
            //                       child: Text(names[index],
            //                         style: TextStyle(
            //                             color: Colors.white,
            //                             fontSize: 15,
            //                             fontFamily: 'Salsa'
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //       slideTransform: RotateDownTransform(),
            //       slideIndicator: CircularSlideIndicator(
            //         padding: EdgeInsets.only(bottom: 32),
            //       ),
            //       itemCount: images.length),
            // ),

            BlocProvider(
              create: (context) =>
              HomeCubit()
                ..getMovies(),
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  HomeCubit movie = HomeCubit.get(context);
                  return movie.moviesModel == null ? CircularProgressIndicator(
                    color: primaryColor,)
                      : AllMoviesCarousel(context, movie);
                },
              ),
            ),

            SizedBox(height: 70),

            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Coming Soon",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Salsa'
                      )
                  ),
                  BlocProvider(
                    create: (context) => HomeCubit()..getCominSoonMovies(),
                    child: BlocConsumer<HomeCubit, HomeState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        HomeCubit movie = HomeCubit.get(context);
                        return movie.upcomingMovies.isEmpty ? CircularProgressIndicator(
                          color: primaryColor,)
                        : UpcomingMoviesCarousel(context, movie.upcomingMovies);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
