import 'package:equatable/equatable.dart';
import 'package:task_movies/movies/core/resourc.dart';
import 'package:task_movies/movies/data/model/movie_model.dart';
import 'package:task_movies/movies/data/model/movies_modelc_ontroller.dart';

enum Status { init, loading, success, error }

class MovieState extends Equatable {
  final Status status;
  final Resource<MoviesModelController>? resorce;

  const MovieState({
    this.resorce,
    this.status = Status.init,
  });

  MovieState copyWith(
      {Resource<MoviesModelController>? resorce, Status status = Status.init}) {
    return MovieState(resorce: resorce ?? this.resorce, status: status);
  }

  @override
  List<Object?> get props => [resorce, status];
}

class MovieInitial extends MovieState {}
