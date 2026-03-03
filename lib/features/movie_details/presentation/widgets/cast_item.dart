import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';

class CastItem extends StatelessWidget {
  final String? image;
  final String? name;
  final String? character;

  const CastItem(
      {super.key, required this.image, required this.name, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorManager.grey,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: Row(
          children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: image != null
          ? ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
            imageUrl: image!,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          )
              : const Icon(Icons.person),
        ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name ?? "",style: getRegular2(color: Colors.white),),
        Text(character ?? "",style: getRegular2(color: Colors.white),),
      ],
    )
    ]
    ,
    )
    ,
    );
  }
}
