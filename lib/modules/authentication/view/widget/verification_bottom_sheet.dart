import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/Const/app_colors.dart';
import '../../../../Utils/Const/assets.dart';
import '../../../../widget/app_text.dart';
import '../../../../widget/custom_bottom_sheet.dart';
import '../../../../widget/custom_button.dart';

class VerificationBottomSheet {
  static show({
    required String title,
    required String message,
    String? secondaryBtnTxt,
    int buttonType = 1, // 1: Success, 2: Failed
    required VoidCallback onTap,
    VoidCallback? secondaryBtnOnTap,
    String? svg,
    String? btnText,
    bool? isDismissible,
  }) {
    return CustomBottomSheet.show(
      isDismissible: isDismissible,
      child: Stack(
        children: [
          if (buttonType == 1) Image.asset(ImagesAsset.confetti),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                      svg ?? (buttonType == 2 ? IconAsset.closeWithCircleSVG : IconAsset.singleTickWithCircleSVG))
                  .paddingAll(24.w),
              AppText(
                title,
                textAlign: TextAlign.center,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
              8.h.verticalSpace,
              AppText(
                message,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 22.w),
              28.h.verticalSpace,
              CustomButton(
                text: btnText ?? "Continue",
                height: 40.h,
                fontWeight: FontWeight.w400,
                onTap: onTap,
              ),
              if (secondaryBtnTxt != null) ...[
                16.h.verticalSpace,
                InkWell(
                  onTap: secondaryBtnOnTap,
                  splashColor: AppColors.transparent,
                  child: AppText(secondaryBtnTxt),
                ),
                4.h.verticalSpace,
              ]
            ],
          ).paddingAll(20.w),
        ],
      ),
    );
  }
}
