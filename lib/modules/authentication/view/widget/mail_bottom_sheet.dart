// import 'package:club_marea/utils/navigation_utils/navigation.dart';
// import 'package:club_marea/utils/navigation_utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// import '../../../../utils/assets.dart';
// import '../../../../widget/app_text.dart';
// import '../../../../widget/custom_bottom_sheet.dart';
// import '../../../../widget/custom_button.dart';
//
// class MailBottomSheet {
//   static show() {
//     // SignInController controller = Get.find<SignInController>();
//     return CustomBottomSheet.show(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(IconAsset.mailWithCircleSVG).paddingAll(24),
//             const AppText(
//               "Mail has been sent!",
//               textAlign: TextAlign.center,
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//             ),
//             12.verticalSpace,
//             const AppText(
//               "A password reset link has been sent to your email address.",
//               fontWeight: FontWeight.w400,
//               textAlign: TextAlign.center,
//             ).paddingSymmetric(horizontal: 32),
//             32.verticalSpace,
//             CustomButton(
//               text: "Confirm",
//               onTap: () {
//                 Get.back();
//                 Navigation.replaceAll(Routes.signInScreen);
//                 // Flow changes have been completed as per the instructions from the TL.
//                 // controller.isButtonDisable.value = true;
//                 // controller.otpString.value = "";
//                 // OtpBottomSheet.show();
//               },
//             )
//           ],
//         ).paddingAll(20),
//       ),
//     );
//   }
// }
