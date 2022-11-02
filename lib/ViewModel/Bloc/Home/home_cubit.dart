import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_theater/Model/MoviesModel.dart';
import 'package:movies_theater/ViewModel/Database/Network/end_points.dart';
import 'package:movies_theater/ViewModel/Database/SharedPreferences.dart';

import '../../../Constants.dart';
import '../../../Model/UpcomingMoviesModel.dart';
import '../../Database/Network/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  // String message = '';
  late List<MoviesModel> moviesModel = [];
  late List<UpcomingMoviesModel> upcomingMovies = [];
  String token = SharedPref.getToken("token").toString();
  PageController pageController = PageController(initialPage: 0, viewportFraction: 1);
  CarouselController carouselController = CarouselController();



  void getMovies(){
    DioHelper.getData(url: moviesEndPoint, token: Token).then((value) {
        for(var movie in value.data){
          moviesModel.add(MoviesModel.fromJson(movie));
        }
        emit(AllMoviesSuccess());
    }).catchError((e) {
      emit(AllMoviesError());
    });
  }

  void getCominSoonMovies(){
    upcomingMovies = [];
    DioHelper.getData(url: upcomingMoviesEndPoint,token: Token).then((value) {
      if(value.statusCode == 200){
        for(var movie in value.data){
          upcomingMovies.add(UpcomingMoviesModel.fromJson(movie));
        }
        emit(UpcomingMoviesSuccess());
      }else{
        emit(UpcomingMoviesError());
      }
    }).catchError((e){
      emit(UpcomingMoviesError());
    });
  }
}
