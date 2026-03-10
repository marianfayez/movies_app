import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';

class ExploreTabItem extends StatelessWidget {
  final String text;
  final Color color;
  const ExploreTabItem({required this.color,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: 6.h, horizontal: 10.w),
        decoration: BoxDecoration(
          border: Border.all(
              color: ColorManager.secondary,
              width: 3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          text,
          style: getSemiBoldStyle(color:color),
          ),
        );
  }
}
