import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/Const/app_colors.dart';
import 'app_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 50,
    this.width,
    this.isButtonFilled = true,
    this.borderWidth,
    this.borderColor,
    this.fontColor,
    this.fontSize,
    this.fontWeight = FontWeight.w500,
  });

  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? borderWidth;
  final bool isButtonFilled;
  final Color? fontColor;
  final Color? borderColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40.r),
      child: Container(
        width: width ?? double.maxFinite,
        height: height?.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isButtonFilled
              ? onTap != null
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.5)
              : null,
          border:
              isButtonFilled ? null : Border.all(color: borderColor ?? AppColors.primaryColor, width: borderWidth ?? 1),
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: AppText(
          text,
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight,
          color: fontColor ?? AppColors.white,
        ),
      ),
    );
  }
}
