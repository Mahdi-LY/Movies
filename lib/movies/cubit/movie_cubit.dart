import 'package:bloc/bloc.dart';
import 'package:task_movies/movies/cubit/movie_state.dart';
import 'package:task_movies/movies/data/repository/movieRepositoryImp.dart';

import '../data/model/movie_model.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());
  MovieRepositoryImp repositoryimpl = MovieRepositoryImp();

  getMovies2() async {
    emit(state.copyWith(status: Status.loading));
    var result = await repositoryimpl.getMovies();

    emit(state.copyWith(resorce: result, status: Status.success));
    print("____________222222____${(result)}___222222___");
  }
}
