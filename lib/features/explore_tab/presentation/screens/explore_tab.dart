import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/request_state.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/explore_tab/presentation/bloc/explore_bloc.dart';
import 'package:movies_app/features/explore_tab/presentation/widgets/browse_tab_item.dart';

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
      create: (context) =>
      getIt<ExploreBloc>()
        ..add(GetExploreListEvent()),
      child: BlocConsumer<ExploreBloc, ExploreState>(
        listener: (context, state) {
          if (state.exploreRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(
                      state.exploreRouteFailures?.message ??
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

          return Scaffold(
              backgroundColor: ColorManager.primary,
              body: Padding(padding: EdgeInsets.only(top: 16.h),
                child: DefaultTabController(
                    length: exploreTabs.length, initialIndex: selectedIndex, child: Column(
                  children: [
                    TabBar(tabs: exploreTabs.map((genres) {
                      bool isSelected =
                          exploreTabs.indexOf(genres) == selectedIndex;
                      return ExploreTabItem();
                    }).toList()),
                  ],

                )),
              ));
        },
      ),
    );
  }
}
