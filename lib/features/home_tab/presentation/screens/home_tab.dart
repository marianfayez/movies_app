import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/auth/presentation/widgets/movie_item.dart';
import 'package:movies_app/features/home_tab/presentation/bloc/get_movies_bloc.dart';
import 'package:movies_app/gen/assets.gen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetMoviesBloc>()
        ..add(GetMoviesEvent())
        ..add(GetUpcomingMoviesEvent()),
      child: BlocConsumer<GetMoviesBloc, GetMoviesState>(
        listener: (context, state) {
          if (state.getUpcomingMoviesRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(
                          state.getUpcomingMoviesRouteFailures?.message ??
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
          if (state.getMoviesRequestState == RequestState.loading ||
              state.getUpcomingMoviesRequestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var movies = state.poplarMovieModel?.results ?? [];
          var upcomingMovies = state.upcomingMoviesModel?.results ?? [];
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: movies.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500${movies[currentIndex].posterPath}",
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
                            Color.fromRGBO(18, 19, 18, 0.8),
                            Color.fromRGBO(18, 19, 18, 0.6),
                            Color(0xFF121312),
                          ],
                          stops: [
                            0.0,
                            0.465,
                            1.0,
                          ],
                        ),
                      ),
                    )),
                    Column(
                      mainAxisSize: MainAxisSize.min, // ده المهم
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Assets.images.availableNow.image(),
                        CarouselSlider.builder(
                          itemBuilder: (context, index, realIndex) {
                            return MovieItem(
                              movieId: movies[index].id ?? 0,
                              voteAverage: (movies[index].voteAverage ?? 0)
                                  .toStringAsFixed(1),
                              movieImage: movies[index].posterPath ?? "",
                            );
                          },
                          itemCount: movies.length,
                          options: CarouselOptions(
                            height: 325.h,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 0.50,
                            enlargeFactor: 0.2,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                        Assets.images.watch.image(),
                      ],
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                   EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Action",
                            style: getRegularStyle3(color: Colors.white),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap:(){

                                },
                                child: Text(
                                  "See More ",
                                  style:
                                      getRegularStyle2(color: ColorManager.secondary),
                                ),
                              ),
                              Icon(Icons.arrow_forward,
                                  color: ColorManager.secondary)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 8.h,),
                      SizedBox(
                        height: 250.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final movie = upcomingMovies[index];
                            return SizedBox(
                              width: 180.w,
                              child: MovieItem(
                                movieId: movie.id ?? 0,
                                voteAverage: (upcomingMovies[index].voteAverage ?? 0)
                                    .toStringAsFixed(1),
                                movieImage: movie.posterPath ?? "",
                              ),
                            );
                          },
                          itemCount: upcomingMovies.length,
                          separatorBuilder: (context, index) => SizedBox(
                            width: 4.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}
