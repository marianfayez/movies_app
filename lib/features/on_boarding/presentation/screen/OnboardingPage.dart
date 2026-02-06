import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/routes/auto_route.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/core/widgets/button.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';
import 'package:movies_app/gen/assets.gen.dart';

class OnboardingPage extends StatelessWidget {
  final AssetGenImage image;
  final String title;
  final String body;
  final PageController controller;

  const OnboardingPage({
    super.key,
    required this.controller,
    required this.image,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    const int lastPageIndex = 5;
    final currentPage = context.watch<OnboardingBloc>().state.currentPage;
    final gradient = AppConstants.onboardingGradients[(currentPage - 1)
        .clamp(0, AppConstants.onboardingGradients.length - 1)];

    return Stack(
      children: [
        Positioned.fill(child: image.image(fit: BoxFit.cover)),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(gradient: gradient),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(
                top: 26.h, left: 16.w, right: 16.w, bottom: 20.h),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(90.r),
                    topLeft: Radius.circular(90.r))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (currentPage == lastPageIndex) ...[
                  Text(title,
                      textAlign: TextAlign.center,
                      style: getBoldTitleStyle(color: ColorManager.white)),
                ],
                if (currentPage >= 1 && currentPage < lastPageIndex) ...[
                  Text(title,
                      textAlign: TextAlign.center,
                      style: getBoldTitleStyle(color: ColorManager.white)),
                  SizedBox(height: 16.h),
                  Text(body,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(color: ColorManager.white)),
                ],
                SizedBox(height: 16.h),
                Column(children: [
                  if (currentPage == 1)
                    Button(
                        text: "Next",
                        onTab: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }),
                  if (currentPage >= 1 && currentPage < lastPageIndex) ...[
                    Button(
                        text: "Next",
                        onTab: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }),
                    SizedBox(height: 16.h),
                    Button(
                        text: "Back",
                        textColor: ColorManager.secondary,
                        isOutlined: true,
                        onTab: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }),
                  ],
                  if (currentPage == lastPageIndex) ...[
                    Button(
                      text: "Finish",
                      onTab: () {
                        context.pushRoute(SignInRoute());
                      },
                    ),
                    SizedBox(height: 12.h),
                    Button(
                      text: "Back",
                      textColor: ColorManager.secondary,
                      isOutlined: true,
                      onTab: () {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ],
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
