import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_movies/movies/core/resourc.dart';
import 'package:task_movies/movies/data/model/movies_modelc_ontroller.dart';

import '../model/movie_model.dart';
import 'movie_repository.dart';

class MovieRepositoryImp extends MovieRepository {
  @override
  Future<Resource<MoviesModelController>> getMovies() async {
    var respons =
        await http.get(Uri.parse('https://smdb.sadeem-lab.com/api/v1/movies'));

    if (respons.statusCode == 200) {
      var json = jsonDecode(respons.body);
      var store = MoviesModelController.fromJson(json);
      print("_____________${store.data![0].title}_______111_______");
      return Success<MoviesModelController>(date: store);
    }
    return Error(message: 'error');
  }
}
