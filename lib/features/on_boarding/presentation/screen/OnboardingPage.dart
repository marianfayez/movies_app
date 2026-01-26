import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/gen/assets.gen.dart';

class OnboardingPage extends StatelessWidget {
  final AssetGenImage image;
  final String title;
  final String body;

   const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: 40.h),
        image.image(height: 300.h),
        const Spacer(),
        Text(
          title,
          style: getBoldTitleStyle(color: ColorManager.white)
        ),
         SizedBox(height: 12.h),
        Text(
          body,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
