import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/routes/auto_route.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen.dart';

class MovieItem extends StatelessWidget {
  final int movieId;
  final String movieImage;
  final String voteAverage;

  const MovieItem({super.key, required this.movieId,required this.movieImage,required this.voteAverage});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.h),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onTap: () {
                  context.pushRoute(MovieDetailsRoute(movieId: movieId.toString(),
                  ));
                },
                child: CachedNetworkImage(imageUrl:
                "https://image.tmdb.org/t/p/w500$movieImage" ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.primary,
                ),
                child: Row(
                  children: [
                    Text("$voteAverage",
                        style: getRegularStyle2(color: Colors.white)),
                    Icon(Icons.star,color:ColorManager.secondary,)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}