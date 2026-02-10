import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/bottom_navigation_bar/presentation/bloc/bottom_navigation_bar_bloc.dart';
import 'package:movies_app/features/bottom_navigation_bar/presentation/bloc/bottom_navigation_bar_state.dart';
import 'package:movies_app/features/bottom_navigation_bar/presentation/screens/bottom_navigation_bar.dart';
import 'package:movies_app/features/home_screen/presentation/screens/home_tab.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> tabs = [
    HomeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBloc(),
      child: Scaffold(
        bottomNavigationBar:   CustomBottomNav(),
        body: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(child: tabs[state.selectedIndex]),
              ],
            );
          },
        ),
      ),
    );
  }
}
