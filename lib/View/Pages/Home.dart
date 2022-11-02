// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
                child: Image.asset("assets/images/stars.png", width: 65, height: 50,)
              ),
              Text("Theater",
                style: GoogleFonts.getFont('Salsa', fontSize: 9, color: textColor, fontWeight: FontWeight.w400)
              )
            ],
          ), drawerKey),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 21),
              child: Center(
                child: Column(
                  children: [
                    Text("Now Playing",
                      style: GoogleFonts.getFont('Salsa', fontSize:33, color: textColor, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 8,),
                    Text("Book Your Ticket Now",
                      style: GoogleFonts.getFont('Salsa', fontSize:10, color: primaryColor, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 42),

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
                  return movie.moviesModel.isEmpty ? Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,),
                  )
                      : movie.moviesModel.length == 1 ?
                    Center(
                      child: Container(
                        height: size.height * 0.3,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              color: backColor,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                image: NetworkImage(movie.moviesModel[0].imageUrl.toString()),
                                fit: BoxFit.fill,
                              )
                          ),
                      ),
                    )
                  :AllMoviesCarousel(context, movie);
                },
              ),
            ),

            SizedBox(height: 102),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(29, 0, 20, 5),
                  child: Text("Coming Soon",
                    style: GoogleFonts.getFont('Roboto', fontSize:17, color: textColor, fontWeight: FontWeight.w700),
                  ),
                ),
                BlocProvider(
                  create: (context) => HomeCubit()..getCominSoonMovies(),
                  child: BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      HomeCubit movie = HomeCubit.get(context);
                      return movie.upcomingMovies.isEmpty ? Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,),
                      )
                      : movie.upcomingMovies.length == 1 ?
                      Center(
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              color: backColor,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                image: NetworkImage(movie.upcomingMovies[0].imageUrl.toString()),
                                fit: BoxFit.fill,
                              )
                          ),
                        ),
                      )
                      : UpcomingMoviesCarousel(context, movie.upcomingMovies);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
