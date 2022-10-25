import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_theater/Model/MoviesModel.dart';
import 'package:movies_theater/ViewModel/Database/Network/end_points.dart';

import '../../Database/Network/dio_helper.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  static MoviesCubit get(context) => BlocProvider.of(context);
  String message = '';
  MoviesModel? moviesModel;

  void getMovies(){
    DioHelper.getData(url: moviesEndPoint).then((value) {
      if(value.statusCode == 200){
        moviesModel = MoviesModel.fromJson(value.data);
        message = "success";
        emit(MoviesSuccess());
      }else{
        message = "error";
        emit(MoviesError());
      }
    }).catchError((e) {
      message = "error";
      emit(MoviesError());
    });
  }
}
