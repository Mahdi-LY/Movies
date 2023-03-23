import 'package:equatable/equatable.dart';

import '../core/resourc.dart';
import '../data/model/movie_model.dart';

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
