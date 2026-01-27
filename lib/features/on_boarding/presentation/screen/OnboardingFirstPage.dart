import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/widgets/button.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';
import 'package:movies_app/gen/assets.gen.dart';

class OnboardingFirstPage extends StatelessWidget {
  final PageController controller;

  const OnboardingFirstPage({super.key,    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Assets.images.moviesPostersGroup.image(fit: BoxFit.cover)),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(30, 30, 30, 0),
                  Color.fromRGBO(18, 19, 18, 0.5),
                  Color.fromRGBO(18, 19, 18, 0.91),
                  Color(0xFF121312),
                ],
                stops: [
                  0.0,
                  0.39,
                  0.675,
                  1.0,
                ],
              ),
            ),
          ),
        ),
         Align(
           alignment: Alignment.bottomCenter,

           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text(
                   "Find Your Next Favorite Movie Here",
                   textAlign: TextAlign.center,
                   style: getBigMediumStyle(color: ColorManager.white)
               ),
               SizedBox(height: 16.h),
               Text(
                   "Get access to a huge library of movies to suit all tastes. You will surely like it.",
                   textAlign: TextAlign.center,
                   style: getRegularStyle(color: ColorManager.white)
               ),
               SizedBox(height: 16.h),
               Button(
                 onTab: () {
                   controller.animateToPage(
                     1,
                     duration: const Duration(milliseconds: 300),
                     curve: Curves.easeInOut,
                   );
                   context
                       .read<OnboardingBloc>()
                       .add(const OnboardingPageChanged(1));
                 },
                 text: "Explore Now",
               ),

             ],
           ),
         )

      ],
    );
  }
}
