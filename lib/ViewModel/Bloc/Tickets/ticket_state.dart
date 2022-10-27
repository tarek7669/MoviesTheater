part of 'ticket_cubit.dart';

@immutable
abstract class TicketState {}

class TicketInitial extends TicketState {}
class TicketSuccess extends TicketState {}
class TicketError extends TicketState {}
