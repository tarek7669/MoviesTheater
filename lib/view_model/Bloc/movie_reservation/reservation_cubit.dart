import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  static ReservationCubit get(context) => BlocProvider.of(context);

  List<String> screen_time= [
    "12:30pm",
    "3:00pm",
    "6:30pm",
    "9:00pm",
    "12:00am"
  ];

  static int time_selected = 1;

  static Map<int, int> temp_map= Map<int, int>();
  Map<int, int> selected = Map<int, int>();
  List<Map<int, int>> seats = [];

  void TimeSelected(int time){
    time_selected = time;
  }

  int getTimeSelected() => time_selected;


  Widget SelectSeat(int i, Size size, int j, String imagePath) {
    selected[i] = j;
    // debugPrint("\n\n\n selected --->  $selected \n\n\n");
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: InkResponse(
          onTap: () {
            temp_map[i] = j;
            seats.add(temp_map);

            debugPrint("\n\n\n seats --->  $seats \n\n\n");

            emit(SeatSelectedSuccess());
          },
          child: SvgPicture.asset(imagePath, width: 20, height: 17,)
      ),
    );
  }
}
