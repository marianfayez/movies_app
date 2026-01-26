import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';

class Button extends StatelessWidget {
  Function onTab;
  String text;

  Button({required this.text, required this.onTab, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: ColorManager.secondary,
        padding: EdgeInsets.symmetric(vertical: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),),
      onPressed: (){
        onTab();
      },
      child: Text(text,style: getSemiBoldStyle(color: Colors.black)),
    );
  }
}
