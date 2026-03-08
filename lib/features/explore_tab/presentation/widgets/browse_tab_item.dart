import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';

class ExploreTabItem extends StatelessWidget {
  const ExploreTabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: 5.h, horizontal: 13.w),
        decoration: BoxDecoration(
          border: Border.all(
              color: ColorManager.secondary,
              width: 3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          "",
          style: getBoldTitleStyle2(color: ColorManager.secondary),
          ),
        );
  }
}
