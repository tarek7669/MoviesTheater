import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/reservation_model.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  static MovieCubit get(context) => BlocProvider.of(context);

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  static int movie_index = 0;

  void init(){
    ReservationModel.day = getDate().day -2;
    ReservationModel.month = months[getDate().month];
  }

  DateTime getDate(){
    final now = DateTime.now();
    return now;
  }


  String calcTime(num minutes){
    int hrs = (int.parse(minutes.toString()) / 60).floor();
    num min = minutes % 60;

    String duration = hrs.toString() + "h : " + min.toString() + "m";
    // debugPrint("\n\n\n duration ---> " + duration + "\n\n\n");
    // debugPrint("\n\n\n rating ---> " + movie.rating.toString() + "\n\n\n");
    return duration.toString();
  }

  MovieDaySelected(int index, int day, String month){
    ReservationModel.day = day;
    ReservationModel.month = month;


    if(getDate().day+1 == day){
      ReservationModel.is_tommorrow = true;
      ReservationModel.is_today = false;
    }
    else if(getDate().day == day){
      ReservationModel.is_today = true;
      ReservationModel.is_tommorrow = false;
    }else{
      ReservationModel.is_today = false;
      ReservationModel.is_tommorrow = false;
    }

    debugPrint("today's day ---> ${getDate().day}  \n day's selected ---> ${day}\n\n\n");
    debugPrint("is_today ---> ${ReservationModel.is_today}  \n is_tommorrow ---> ${ReservationModel.is_tommorrow}\n\n\n");

    movie_index = index;
    emit(SelectMovieDay());
  }

  int getDaySelected(){
    return movie_index;
  }
}
