import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/core/widgets/app_bar.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/cast_item.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/info_container.dart';
import 'package:movies_app/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({required this.movieId, super.key});

  final int movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = getIt<MovieDetailsBloc>();

    bloc.add(AddToHistoryEvent(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsBloc>()
        ..add(GetMoviesDetailsEvent(widget.movieId))
        ..add(GetMovieScreenShotEvent(widget.movieId))
        ..add(GetSimilarMoviesEvent(widget.movieId))
        ..add(GetMovieCastEvent(widget.movieId)),
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
          final screenShot = state.movieScreenShotModel?.backdrops ?? [];
          final similarMovies = state.similarMoviesModel?.results ?? [];
          final movieCast = state.movieCastModel?.cast ?? [];

          return Scaffold(
            backgroundColor: ColorManager.primary,
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
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 645.h,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                              child: movie?.posterPath != null
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
                                Text(movie?.title ?? "No Title",
                                    style: getBoldTitleStyle2(
                                        color: Colors.white)),
                                Text(
                                  movie?.releaseDate != null &&
                                          movie!.releaseDate!.length >= 4
                                      ? movie.releaseDate!.substring(0, 4)
                                      : "No Date",
                                  style: getBoldStyle2(
                                      color: const Color(0xFFADADAD)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomElevatedButton(
                          isStadiumBorder: false,
                          backgroundColor: const Color(0xFFE82626),
                          label: "Watch",
                          onTap: () async {
                            final link = movie?.homepage;
                            print(link);
                            if (link != null && link.isNotEmpty) {
                              final Uri url = Uri.parse(link);
                              if (!await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              )) {
                                debugPrint("Could not launch $link");
                              }
                            } else {
                              debugPrint("No homepage available");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("No watch link available")),
                              );
                            }
                          }),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                )),

                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<MovieDetailsBloc>()
                              .add(ToggleFavoriteEvent(widget.movieId,state.isFavorite));
                        },
                        child: InfoContainer(
                            icon: Icon(
                              state.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),

                            value: state.isFavorite? (movie?.voteCount ?? 0)+1
                                :movie?.voteCount ?? 0),
                      ),
                      InfoContainer(
                          icon: Icon(Icons.timer_outlined,
                              color: ColorManager.secondary),
                          value: movie?.runtime ?? 0),
                      InfoContainer(
                          icon: Icon(Icons.star, color: ColorManager.secondary),
                          value: movie?.voteAverage ?? 0),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 16.h,
                // ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w, top: 8.h),
                            child: Text(
                              "Screen Shots",
                              style: getBoldTitleStyle2(color: Colors.white),
                            ),
                          )),
                      SizedBox(
                        height: 200.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: CachedNetworkImage(
                                      imageUrl: screenShot[index].fullImageUrl,
                                      height: 150.h),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 6.w,
                                ),
                            itemCount: screenShot.length),
                      ),
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Text(
                          "Similar",
                          style: getBoldTitleStyle2(color: Colors.white),
                        ),
                      )),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 500.h,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                      ),
                      itemCount: similarMovies.length,
                      itemBuilder: (context, index) {
                        final movie = similarMovies[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                            onTap: () {
                              context.replaceRoute(
                                MovieDetailsRoute(movieId: movie.id ?? 0),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: movie.posterPath != null
                                  ? "https://image.tmdb.org/t/p/w500${movie.posterPath}"
                                  : "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              "Summary",
                              style: getBoldTitleStyle2(color: Colors.white),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(movie?.overview ?? "No Overview",
                            style: getRegularStyle2(color: Colors.white)),
                      ),
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, bottom: 8.h),
                    child: Text(
                      "Cast",
                      style: getBoldTitleStyle2(color: Colors.white),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final cast = movieCast[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        child: CastItem(
                          image: cast.profilePath != null
                              ? "https://image.tmdb.org/t/p/w500${cast.profilePath}"
                              : null,
                          name: "Name: ${cast.name ?? ""}",
                          character: "Character: ${cast.character ?? ""}",
                        ),
                      );
                    },
                    childCount: movieCast.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
