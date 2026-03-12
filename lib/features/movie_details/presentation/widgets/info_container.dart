import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';

class InfoContainer extends StatelessWidget {
  final Icon icon;
  final dynamic value;
  const InfoContainer({super.key,required this.icon,required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorManager.grey,
      ),
      child: Row(
        children: [
          icon,
           SizedBox(width: 10.w),
          Text( value != null ? value.toString() : "N/A", style: getBoldStyle2(color: Colors.white)),
        ],
      ),
    );
  }
}
