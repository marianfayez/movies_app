import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/widgets/app_bar.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:movies_app/gen/assets.gen.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({required this.movieId, super.key});

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MovieDetailsBloc>()..add(GetMoviesDetailsEvent(movieId)),
      child: BlocConsumer<MovieDetailsBloc, MoviesDetailsState>(
        listener: (context, state) {
          if (state.moviesDetailsRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(state.moviesDetailsRouteFailures?.message ??
                          "Something went wrong"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"))
                      ],
                    ));
          }
        },
        builder: (context, state) {
          if (state.moviesDetailsRequestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var movie = state.movieDetailsModel;
          return SafeArea(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: MyAppBar(
                isTransparent: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.bookmark),
                    onPressed: () {},
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 500.h,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                              child: movie?.posterPath!=null
                                  ? CachedNetworkImage(
                                imageUrl:
                                "https://image.tmdb.org/t/p/w500${movie?.posterPath}",
                                fit: BoxFit.cover,
                              )
                                  : Assets.images.onBoarding6
                                  .image(fit: BoxFit.cover)),
                          Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(18, 19, 18, 0.2),
                                      Color(0xFF121312),
                                    ],
                                    stops: [0.0, 1.0],

                                  ),
                                ),
                              )),
                          Icon(
                            Icons.play_circle_outline,
                            color: ColorManager.secondary,
                            size: 50,
                          ),

                          Positioned(
                            bottom: 40.h,
                            left: 20.w,
                            right: 20.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(movie?.title ?? "No Title", style: getBoldTitleStyle2(color: Colors.white)),
                                Text(
                                  movie?.releaseDate != null && movie!.releaseDate!.length >= 4
                                      ? movie.releaseDate!.substring(0, 4)
                                      : "No Date",
                                  style: getBoldStyle2(color: const Color(0xFFADADAD)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
