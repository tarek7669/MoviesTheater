// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/ColorConsts.dart';
import 'package:movies_theater/View/Components/Core/CustomAppBar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:movies_theater/View/Pages/BottomNavigationBar.dart';
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

            // SizedBox(height: 42),

            //TEST UNTIL SERVER IS BACK



            // Container(
            //   height: size.height * 0.5,
            //   child: Swiper(
            //     itemBuilder: (BuildContext context,int index){
            //       return Image.asset(images[index],fit: BoxFit.fill,);
            //     },
            //     itemCount: images.length,
            //     pagination: SwiperPagination(),
            //     control: SwiperControl(),
            //   ),
            // ),

            BlocProvider(
              create: (context) => HomeCubit(),
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  HomeCubit home = HomeCubit.get(context);
                  return Container(
                    // color: Colors.red,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[home.backgroundIndex]),
                          fit: BoxFit.fill
                        )
                      ),
                      height: size.height * 0.5,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    backColor.withOpacity(1),
                                    backColor.withOpacity(0.0),
                                    backColor.withOpacity(1),
                                  ],
                                  // stops: [
                                  //   0.0,
                                  //   1.0,
                                  //   2.0
                                  // ]
                              ),
                              // borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          Swiper(
                            layout: SwiperLayout.CUSTOM,
                            onIndexChanged: (index){
                              home.changeBackground(index);
                            },
                            customLayoutOption: CustomLayoutOption(

                                startIndex: -1,
                                stateCount: images.length
                            )..addRotate([
                              -45.0/180,
                              0.0,
                              45.0/180
                            ])..addTranslate([
                              Offset(-200.0, -20.0),
                              Offset(0.0, 0.0),
                              Offset(200.0, -20.0)
                            ]),
                            itemWidth: 150.0,
                            itemHeight: 200.0,
                            // pagination: SwiperPagination(),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(images[index]),
                                          fit: BoxFit.fill
                                      )
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                          backColor.withOpacity(0.0),
                                          backColor.withOpacity(1.0),
                                        ],
                                        stops: [
                                          0.0,
                                          1.0,
                                        ]
                                      ),
                                      // borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(12, 150, 0, 22),
                                    child: Center(
                                      child: Text(names[index].toString(),
                                        style: GoogleFonts.getFont('Roboto', color: textColor, fontWeight: FontWeight.w700, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: images.length,
                          ),
                        ],
                      )
                  );
                },
              ),
            ),

            // BlocProvider(
            //   create: (context) =>
            //   HomeCubit()
            //     ..getMovies(),
            //   child: BlocConsumer<HomeCubit, HomeState>(
            //     listener: (context, state) {
            //       // TODO: implement listener
            //     },
            //     builder: (context, state) {
            //       HomeCubit movie = HomeCubit.get(context);
            //       return movie.moviesModel.isEmpty ? Center(
            //         child: CircularProgressIndicator(
            //           color: primaryColor,),
            //       )
            //           : movie.moviesModel.length == 1 ?
            //         Center(
            //           child: Container(
            //             height: size.height * 0.3,
            //               width: size.width * 0.5,
            //               decoration: BoxDecoration(
            //                   color: backColor,
            //                   borderRadius: BorderRadius.all(Radius.circular(20)),
            //                   image: DecorationImage(
            //                     image: NetworkImage(movie.moviesModel[0].imageUrl.toString()),
            //                     fit: BoxFit.fill,
            //                   )
            //               ),
            //           ),
            //         )
            //       :AllMoviesCarousel(context, movie);
            //     },
            //   ),
            // ),

            SizedBox(height: 22),

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
