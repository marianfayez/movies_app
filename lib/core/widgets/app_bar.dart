import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool centerTitle;
  final bool isTransparent;

  const MyAppBar({
    super.key,
     this.title,
    this.actions,
    this.backgroundColor,
    this.centerTitle = true,
    this.isTransparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isTransparent
          ? Colors.transparent
          : backgroundColor ?? ColorManager.primary,
      elevation: isTransparent ? 0 : 4,
      iconTheme: IconThemeData(color: ColorManager.secondary),
      title: title != null
          ? Text(
              title!,
              style: getRegularStyle2(
                color: ColorManager.secondary,
              ),
            )
          : null,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
