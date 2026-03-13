import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/request_state.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/explore_tab/presentation/bloc/explore_bloc.dart';
import 'package:movies_app/features/explore_tab/presentation/widgets/browse_tab_item.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/movie_item.dart';
import 'package:movies_app/core/widgets/movie_grid_view.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExploreBloc>()..add(GetExploreListEvent()),
      child: BlocConsumer<ExploreBloc, ExploreState>(
        listener: (context, state) {
          if (state.exploreRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(state.exploreRouteFailures?.message ??
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
          if (state.exploreRequestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var exploreTabs = state.exploreListModel?.genres ?? [];
          var exploreMovies = state.exploreMoviesModel?.results ?? [];

          return SafeArea(
            child: Scaffold(
                backgroundColor: ColorManager.primary,
                body: Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: DefaultTabController(
                      length: exploreTabs.length,
                      initialIndex: selectedIndex,
                      child: Column(
                        children: [
                          TabBar(
                              onTap: (index) {
                                setState(() {
                                  selectedIndex = index;
                                });
                                final genreId = exploreTabs[index].id;

                                context.read<ExploreBloc>().add(
                                      GetExploreMovieEvent(genreId ?? 0),
                                    );
                              },
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 6.w),
                              dividerColor: Colors.transparent,
                              unselectedLabelColor: ColorManager.secondary,
                              labelColor: ColorManager.primary,
                              indicator: BoxDecoration(
                                color: ColorManager.secondary,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                    color: ColorManager.secondary, width: 3),
                              ),
                              isScrollable: true,
                              tabs: exploreTabs.map((genres) {
                                bool isSelected = exploreTabs.indexOf(genres) ==
                                    selectedIndex;
                                return ExploreTabItem(
                                  text: "${genres.name}",
                                  color: isSelected
                                      ? ColorManager.primary
                                      : ColorManager.secondary,
                                );
                              }).toList()),
                          SizedBox(
                            height: 16.h,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                   EdgeInsets.symmetric(horizontal: 16.h),
                              child: MoviesGridView(
                                movies: exploreMovies,
                              )
                            ),
                          )
                        ],
                      )),
                )),
          );
        },
      ),
    );
  }
}
