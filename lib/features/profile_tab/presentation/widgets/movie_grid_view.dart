import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/movie_item.dart';

class MoviesGridView extends StatelessWidget {
  final List<Results> movies;

  const MoviesGridView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.h,
        childAspectRatio: .7,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return MovieItem(
          movieId: movie.id ?? 0,
          voteAverage: (movie.voteAverage ?? 0).toStringAsFixed(1),
          movieImage: movie.posterPath ?? "",
        );
      },
    );
  }
}