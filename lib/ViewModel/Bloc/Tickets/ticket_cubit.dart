import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_theater/Model/TicketsModel.dart';

import '../../../Constants.dart';
import '../../Database/Network/dio_helper.dart';
import '../../Database/Network/end_points.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitial());

  static TicketCubit get(context) => BlocProvider.of(context);

  List<TicketsModel> ticketsModel = [];

  void getTickets(){
    DioHelper.getData(url: ticketsEndPoint,token: Token).then((value) {
      debugPrint("\n\n\n ${value.data} \n\n\n");

      if(value.statusCode == 200){
        for(var movie in value.data){
          ticketsModel.add(TicketsModel.fromJson(movie));
        }
        emit(TicketSuccess());
      }else{
        emit(TicketError());
      }
    }).catchError((e){
      emit(TicketError());
    });
  }
}
