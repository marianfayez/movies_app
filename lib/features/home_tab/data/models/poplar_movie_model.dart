import 'package:movies_app/features/home_tab/data/models/movie_model.dart';

class PoplarMovieModel {
  PoplarMovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,});

  PoplarMovieModel.fromJson(dynamic json) {
    page = json['page'];
    results = (json['results'] as List?)
        ?.map((item) => MovieModel.fromJson(item))
        .toList() ?? [];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

}

