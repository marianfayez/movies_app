import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      create: (context) => getIt<GetMoviesBloc>()..add(GetMoviesEvent()),
      child: BlocConsumer<GetMoviesBloc, GetMoviesState>(
        listener: (context, state) {
          if (state.requestState == RequestState.loading) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const AlertDialog(
                      title: Center(child: CircularProgressIndicator()),
                      backgroundColor: Colors.transparent,
                    ));
          } else if (state.requestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(state.routeFailures?.message ??
                          "Something went wrong"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"))
                      ],
                    ));
          } else if (state.requestState == RequestState.success) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var movies = state.poplarMovieModel?.results ?? [];
          return Stack(
            children: [
              Positioned.fill(
                  child: movies.isNotEmpty
            ? Image.network(
            "https://image.tmdb.org/t/p/w500${movies[currentIndex].posterPath}",
            fit: BoxFit.cover,
          )
              : Assets.images.onBoarding6.image(fit: BoxFit.cover)),
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
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Assets.images.availableNow.image(),
                    CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        return MovieItem(
                          movieId: movies[index].id ?? 0,
                          voteAverage:( movies[index].voteAverage ?? 0).toStringAsFixed(1),
                          movieImage: movies[index].posterPath ?? "",
                        );
                      },
                      itemCount: movies.length,
                      options: CarouselOptions(
                        height: 440.h,
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
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
