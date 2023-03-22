import 'package:task_movies/movies/data/model/movie_model.dart';

import '../../core/resourc.dart';
import '../model/movies_modelc_ontroller.dart';

abstract class MovieRepository {
  Future<Resource<MoviesModelController>> getMovies();
}
