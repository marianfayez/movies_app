class MovieScreenShotModel {
  MovieScreenShotModel({
    this.id,
    this.backdrops,
    this.logos,
    this.posters,
  });

  MovieScreenShotModel.fromJson(dynamic json) {
    id = json['id'];

    backdrops = (json['backdrops'] as List?)
        ?.map((item) => MovieImage.fromJson(item))
        .toList() ??
        [];

    logos = (json['logos'] as List?)
        ?.map((item) => MovieImage.fromJson(item))
        .toList() ??
        [];

    posters = (json['posters'] as List?)
        ?.map((item) => MovieImage.fromJson(item))
        .toList() ??
        [];
  }

  int? id;
  List<MovieImage>? backdrops;
  List<MovieImage>? logos;
  List<MovieImage>? posters;
}

class MovieImage {
  MovieImage({
    this.aspectRatio,
    this.height,
    this.iso31661,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  MovieImage.fromJson(dynamic json) {
    aspectRatio = (json['aspect_ratio'] as num?)?.toDouble();
    height = json['height'];
    iso31661 = json['iso_3166_1'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = (json['vote_average'] as num?)?.toDouble();
    voteCount = json['vote_count'];
    width = json['width'];
  }

  double? aspectRatio;
  int? height;
  String? iso31661;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  String get fullImageUrl =>
      "https://image.tmdb.org/t/p/w500$filePath";
}