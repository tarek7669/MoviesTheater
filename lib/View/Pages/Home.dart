import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/ColorConsts.dart';

import '../../ViewModel/Bloc/Movies/movies_cubit.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      drawer: Container(
        width: (size.width / 3) * 2,
        color: Colors.grey[900],
      ),
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: backColor,
        title: Column(
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
        ),
        centerTitle: true,
        leading: InkResponse(
            onTap: () {
              drawerKey.currentState!.openDrawer();
            },
            child: Image.asset("assets/icons/drawerIcon.png")
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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

            BlocProvider(
              create: (context) => MoviesCubit(),
              child: BlocConsumer<MoviesCubit, MoviesState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  MoviesCubit movie = MoviesCubit.get(context);
                  return movie.moviesModel == null ? CircularProgressIndicator(color: primaryColor,)
                  : CarouselSlider(
                    items: [],
                    options: CarouselOptions(height: 400.0),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
