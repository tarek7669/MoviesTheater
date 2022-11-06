part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class SeatSelectedSuccess extends ReservationState {}
