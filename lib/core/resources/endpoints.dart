class EndPoints {
  static const String getMovies = "/3/movie/popular";
  static const String getUpcomingMovies = "/3/movie/upcoming";
  static  String getMoviesDetails (String movieId)=> "/3/movie/$movieId?";


}
