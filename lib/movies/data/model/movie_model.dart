import 'package:task_movies/movies/core/resourc.dart';
import 'package:task_movies/movies/data/model/movies_modelc_ontroller.dart';

class MoviesModelController {
  Meta? meta;
  List<Data>? data;

  MoviesModelController({this.meta, this.data});

  MoviesModelController.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
