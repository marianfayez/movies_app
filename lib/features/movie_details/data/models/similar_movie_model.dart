import 'package:movies_app/features/home_tab/data/models/movie_model.dart';

class SimilarMoviesModel {
  SimilarMoviesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,});

  SimilarMoviesModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

}
