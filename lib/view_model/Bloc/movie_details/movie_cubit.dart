import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
  static int movieDay = 0;

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

  MovieDaySelected(int day){
    movieDay = day;
    emit(SelectMovieDay());
  }

  int getDaySelected(){
    return movieDay;
  }
}
