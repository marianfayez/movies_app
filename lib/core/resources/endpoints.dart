class EndPoints {
  static const String getMovies = "/3/movie/popular";
  static const String getUpcomingMovies = "/3/movie/upcoming";
  static  String getMoviesDetails (int movieId)=> "/3/movie/$movieId?";

  static String getMovieScreenShot(int movieId) =>
      "/3/movie/$movieId/images?";
  static String getSimilarMovies(int movieId) =>
      "/3/movie/$movieId/similar?";
  static String getMovieCast(int movieId) =>
      "/3/movie/$movieId/credits?";
  static String getMovieByName(String name) =>
      "/3/search/movie?query=${Uri.encodeComponent(name)}";
}
