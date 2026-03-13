import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/movie_item.dart';
import 'package:movies_app/features/profile_tab/presentation/bloc/profile_bloc.dart';
import 'package:movies_app/features/profile_tab/presentation/widgets/movie_grid_view.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final historyMovies = state.history ?? [];
        final favoriteMovies = state.favorites ?? [];
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                isScrollable: false,
                dividerColor: Colors.transparent,
                indicatorColor: ColorManager.secondary,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  Column(
                    children: [
                      Icon(Icons.list, color: ColorManager.secondary),
                      SizedBox(height: 4.h),
                      Text(
                        "Wish List",
                        style: getRegular2(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.folder, color: ColorManager.secondary),
                      SizedBox(height: 4.h),
                      Text(
                        "History",
                        style: getRegular2(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.h,),
              SizedBox(
                height: 400.h,
                child: TabBarView(
                  children: [
                    MoviesGridView(movies: favoriteMovies),
                    MoviesGridView(movies: historyMovies)

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
