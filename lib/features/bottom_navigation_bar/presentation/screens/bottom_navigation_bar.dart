import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/features/bottom_navigation_bar/presentation/bloc/bottom_navigation_bar_bloc.dart';
import 'package:movies_app/features/bottom_navigation_bar/presentation/bloc/bottom_navigation_bar_event.dart';
import 'package:movies_app/features/bottom_navigation_bar/presentation/bloc/bottom_navigation_bar_state.dart';


class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
        ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8,right: 8,left: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: state.selectedIndex,
                onTap: (index) {
                  context.read<BottomNavBloc>()
                      .add(ChangeTabEvent(selectedIndex: index));
                },
                selectedItemColor: ColorManager.secondary,
                unselectedItemColor: Colors.white,
                backgroundColor: ColorManager.grey,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
