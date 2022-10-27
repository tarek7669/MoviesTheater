import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/ColorConsts.dart';
import 'package:movies_theater/View/Components/Core/CustomAppBar.dart';

import '../../ViewModel/Bloc/Home/home_cubit.dart';
import '../Components/Core/Drawer.dart';
import '../Components/Home/AllMoviesCarousel.dart';
import '../Components/Home/UpcomingMoviesCarousel.dart';

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
