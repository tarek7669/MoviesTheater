part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}
class MoviesSuccess extends MoviesState {}
class MoviesError extends MoviesState {}
