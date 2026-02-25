import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/gen/assets.gen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Assets.images.onBoarding6.image(fit: BoxFit.cover)),
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
            ],
          ),
        )
      ],
    );
  }
}
