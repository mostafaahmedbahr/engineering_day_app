import 'dart:io';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, this.pickedImage, required this.function});
  final XFile? pickedImage;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: pickedImage == null
                ? Container(
              height: 115,
              width:  115,
              decoration: BoxDecoration(
              color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: AppColors.whiteColor
                ),
              ),
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
                  child: Image.file(
                                File(
                  pickedImage!.path,
                                ),
                                fit: BoxFit.fill,
                    height: 115,
                    width:  115,
                              ),
                ),
          ),
        ),
        Positioned(
          child: InkWell(
            splashColor: Colors.red,
            borderRadius: BorderRadius.circular(16.0),
            onTap: () {
              function();
            },
            child:   Padding(
              padding: const EdgeInsets.all(8.0),
              child:SvgPicture.asset(AppImages.camera),
            ),
          ),
        ),
      ],
    );
  }
}
