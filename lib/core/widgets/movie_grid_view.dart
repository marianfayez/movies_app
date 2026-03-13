import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home_tab/data/models/movie_model.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/movie_item.dart';

class MoviesGridView extends StatelessWidget {
  final List<MovieModel> movies;


  const MoviesGridView({super.key, required this.movies,
   });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
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
