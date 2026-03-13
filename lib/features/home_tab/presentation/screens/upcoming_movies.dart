import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/home_tab/presentation/bloc/get_movies_bloc.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/movie_item.dart';
import 'package:movies_app/core/widgets/movie_grid_view.dart';

import '../../../../core/resources/request_state.dart';

@RoutePage()
class UpcomingMoviesScreen extends StatelessWidget {
  const UpcomingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetMoviesBloc>()..add(GetUpcomingMoviesEvent()),
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
          if (state.getUpcomingMoviesRequestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var upcomingMovies = state.upcomingMoviesModel?.results ?? [];

          return SafeArea(
            child: Scaffold(
              backgroundColor: ColorManager.primary,
                body: Column(
              children: [
                Expanded(
                    child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.h),
                        child: MoviesGridView(
                          movies: upcomingMovies,
                        )))
              ],
            )),
          );
        },
      ),
    );
  }
}
