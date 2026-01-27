import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';

class Button extends StatelessWidget {
  Function onTab;
  String text;
  final Color textColor;
  final bool isOutlined;

  Button({required this.text,
    required this.onTab, // default
    this.textColor = Colors.black,
    this.isOutlined = false,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: isOutlined ? ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(color: textColor, width: 2),
        ),
      ) : ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: ColorManager.secondary,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: () {
        onTab();
      },
      child: Text(text, style: getSemiBoldStyle(color: textColor)),
    );
  }
}
