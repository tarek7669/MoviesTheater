import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';
import 'package:movies_theater/model/reservation_model.dart';

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
  List<String> seats_codes= [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];



  static int time_selected = 1;

  static Map<int, int> temp_map= {};
  static int seat_index = 0;
  Map<Map<int, int>, String> temp_image_map = {};

  Map<int, int> selected = Map<int, int>();
  List<Map<Map<int, int>, String>> seats = List.empty(growable: true);
  List<List<bool>> seats_test = List.generate(7, (i) => List.filled(9,false, growable: true), growable: true);

  void init(){
    ReservationModel.time = screen_time[2];
  }

  void TimeSelected(int time){
    time_selected = time;
  }

  int getTimeSelected() => time_selected;


  Widget SelectSeat(int i, Size size, int j, String image_path) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: InkResponse(
          onTap: () {
            String selected_seat = seats_codes[i] + (j + 1).toString();

            seats_test[i][j] = !seats_test[i][j];
            if(!ReservationModel.reserved_seats.contains(selected_seat)){
              ReservationModel.pay_sum += 50;
              ReservationModel.num_of_selected_seats += 1;
              ReservationModel.reserved_seats.add(selected_seat);
            }
            else{
              ReservationModel.pay_sum -= 50;
              ReservationModel.num_of_selected_seats -= 1;
              ReservationModel.reserved_seats.remove(selected_seat);
            }

            // debugPrint("\n\n\n ReservationModel.reserved_seats --->  ${ReservationModel.reserved_seats} \n\n\n");
            // debugPrint("\n\n\n seats of [$i , $j] --->  ${seats_test[i][j]} \n\n\n");

            emit(SeatSelectedSuccess());
          },
        child: SvgPicture.asset(image_path, width: 20, height: 17,)
      ),
    );
  }
}
