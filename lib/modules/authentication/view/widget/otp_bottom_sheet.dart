import 'package:apna_wash/modules/authentication/view/widget/verification_bottom_sheet.dart';
import 'package:dev_print/dev_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../Utils/Const/app_colors.dart';
import '../../../../Utils/navigation_utils/navigation.dart';
import '../../../../Utils/navigation_utils/routes.dart';
import '../../../../widget/app_text.dart';
import '../../../../widget/custom_bottom_sheet.dart';
import '../../../../widget/custom_button.dart';
import '../../controller/log_in_controller.dart';

class OtpBottomSheet {
  static show() {
    LogInController controller = Get.find<LogInController>();
    return CustomBottomSheet.show(
      isDismissible: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppText(
              "Verify your OTP",
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            8.verticalSpace,
            AppText(
              "your phone number is ${controller.phoneTxtController.text}",
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: 24),
            28.verticalSpace,
            Pinput(
              length: 6,
              defaultPinTheme: PinTheme(
                width: 52,
                height: 52,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.textColor.withOpacity(0.2)),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 52,
                height: 52,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryColor),
                ),
              ),
              onChanged: (value) {
                controller.otpString.value = value;
                controller.handleOtpButtonDisable();
              },
            ),
            125.verticalSpace,
            // Obx(() {
            //   return InkWell(
            //     onTap: controller.remainingTime.value == 0
            //         ? () {
            //             controller.reStartTimer();
            //           }
            //         : null,
            //     splashColor: AppColors.transparent,
            //     child: RichText(
            //       textAlign: TextAlign.center,
            //       text: TextSpan(children: [
            //         const TextSpan(
            //           text: "Didn’t receive code? ",
            //           style: TextStyle(fontSize: 13, color: AppColors.textColor),
            //         ),
            //         TextSpan(
            //           text: controller.remainingTime.value == 0
            //               ? "Resend Code?"
            //               : "00:${controller.remainingTime.value.toString().padLeft(2, '0')}",
            //           style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
            //         ),
            //       ]),
            //     ),
            //   );
            // }),
            // 16.verticalSpace,
            Obx(() {
              return CustomButton(
                text: "Confirm",
                onTap: controller.isButtonDisable.value
                    ? null
                    : () {
                        controller.verifyOTP();
                      },
              );
            }),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
