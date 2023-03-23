
import '../../core/resourc.dart';
import '../model/movie_model.dart';
import '../model/movies_modelc_ontroller.dart';

abstract class MovieRepository {
  Future<Resource<MoviesModelController>> getMovies();
}
