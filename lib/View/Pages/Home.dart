import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/ColorConsts.dart';
import 'package:movies_theater/View/Components/Core/CustomAppBar.dart';

import '../../ViewModel/Bloc/Home/home_cubit.dart';
import '../Components/Core/Drawer.dart';
import '../Components/Home/AllMoviesCarousel.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      key: drawerKey,
      drawer: CustomDrawer(size),
      backgroundColor: backColor,

      appBar: CustomAppBar(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Stars",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 35
                  )
              ),
              Text("Theater",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
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
                          fontSize: 35
                      ),
                    ),
                    Text("Book Your Ticket Now",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 50),

            BlocProvider(
              create: (context) => HomeCubit()..getMovies(),
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  HomeCubit movie = HomeCubit.get(context);
                  return movie.moviesModel == null ? CircularProgressIndicator(color: primaryColor,)
                  : AllMoviesCarousel(context, movie.moviesModel);
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
                      fontSize: 25
                    )
                  ),
                  CarouselSlider(
                    items: [],
                    options: CarouselOptions(
                      height: 266.0,
                      scrollPhysics: BouncingScrollPhysics(),
                      // autoPlay: true,
                      // autoPlayCurve: Curves.bounceInOut
                      aspectRatio: 10,

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
