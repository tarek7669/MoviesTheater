import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_theater/Model/MoviesModel.dart';
import 'package:movies_theater/ViewModel/Database/Network/end_points.dart';
import 'package:movies_theater/ViewModel/Database/SharedPreferences.dart';

import '../../../Constants.dart';
import '../../Database/Network/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  String message = '';
  late List<MoviesModel> moviesModel = [];
  String token = SharedPref.getToken("token").toString();

  void getMovies(){

    DioHelper.getData(url: moviesEndPoint, token: Token).then((value) {
      if(value.statusCode == 200){

        for(var movie in value.data){
          moviesModel.add(MoviesModel.fromJson(movie));
        }

        // moviesModel = MoviesModel.fromJson(value.data);
        message = "success";
        emit(AllMoviesSuccess());
      }else{
        message = "error";
        emit(AllMoviesError());
      }
    }).catchError((e) {
      message = "error";
      emit(AllMoviesError());
    });
  }

  void getCominSoonMovies(){
    DioHelper.getData(url: upcomingMoviesEndPoint,token: Token).then((value) {

    });
  }
}
