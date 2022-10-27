part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class AllMoviesSuccess extends HomeState {}
class AllMoviesError extends HomeState {}

class UpcomingMoviesSuccess extends HomeState {}
class UpcomingMoviesError extends HomeState {}
