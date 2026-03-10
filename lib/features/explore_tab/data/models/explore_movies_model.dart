class ExploreMoviesModel {
  int? page;
  List<MovieResult>? results;
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
        results!.add(MovieResult.fromJson(v));
      });
    }
  }
}
class MovieResult {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieResult({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieResult.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = (json['popularity'] as num?)?.toDouble();
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = (json['vote_average'] as num?)?.toDouble();
    voteCount = json['vote_count'];
  }
}