import 'package:bloc/bloc.dart';

import '../data/model/movie_model.dart';
import '../data/repository/movieRepositoryImp.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());
  MovieRepositoryImp repositoryimpl = MovieRepositoryImp();

  getMovies2() async {
    emit(state.copyWith(status: Status.loading));
    var result = await repositoryimpl.getMovies();

    emit(state.copyWith(resorce: result, status: Status.success));
    //print("____________222222____${(result)}___222222___");
  }
}
