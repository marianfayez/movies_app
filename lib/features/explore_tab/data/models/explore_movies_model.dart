import 'package:movies_app/features/home_tab/data/models/movie_model.dart';

class ExploreMoviesModel {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  ExploreMoviesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  ExploreMoviesModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];

    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(MovieModel.fromJson(v));
      });
    }
  }
}
