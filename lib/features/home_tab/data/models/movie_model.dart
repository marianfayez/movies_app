class MovieModel {
  int? id;
  String? posterPath;
  double? voteAverage;
  String? title;
  String? overview;

  MovieModel({
    this.id,
    this.posterPath,
    this.voteAverage,
    this.title,
    this.overview,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['poster_path'];
    voteAverage = (json['vote_average'] as num?)?.toDouble();
    title = json['title'];
    overview = json['overview'];
  }
}