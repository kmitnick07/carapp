// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// import '../../../../utils/app_colors.dart';
// import '../../../../utils/assets.dart';
// import '../../../../utils/navigation_utils/navigation.dart';
// import '../../../../utils/navigation_utils/routes.dart';
// import '../../../../widget/annotated_region.dart';
// import '../../../../widget/app_text.dart';
// import '../../../../widget/custom_button.dart';
// import '../../../../widget/custom_textfield.dart';
// import '../../controller/log_in_controller.dart';
// import '../widget/verification_bottom_sheet.dart';
//
// class NewPasswordScreen extends StatelessWidget {
//   const NewPasswordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//         init: SignInController(),
//         builder: (controller) {
//           return CustomAnnotatedRegions(
//             child: Scaffold(
//               resizeToAvoidBottomInset: true,
//               body: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [
//                           AppColors.primaryColor.withOpacity(0.2),
//                           AppColors.white.withOpacity(0.41),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SafeArea(
//                     child: Stack(
//                       alignment: Alignment.bottomCenter,
//                       children: [
//                         LayoutBuilder(
//                           builder: (context, constraint) {
//                             return SingleChildScrollView(
//                               physics: const AlwaysScrollableScrollPhysics(),
//                               child: ConstrainedBox(
//                                 constraints: BoxConstraints(minHeight: constraint.maxHeight),
//                                 child: Column(
//                                   children: [
//                                     SvgPicture.asset(IconAsset.logoBlackSVG).paddingSymmetric(vertical: 40.h),
//                                     AppText(
//                                       "Create a new Password",
//                                       textAlign: TextAlign.center,
//                                       fontSize: 22.sp,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                     8.h.verticalSpace,
//                                     const AppText(
//                                       "Create a new password to secure your account",
//                                       fontWeight: FontWeight.w400,
//                                       textAlign: TextAlign.center,
//                                     ).paddingSymmetric(horizontal: 50.w),
//                                     24.h.verticalSpace,
//                                     Obx(() {
//                                       return CustomTextField(
//                                         controller: controller.passwordTxtController,
//                                         title: "Password",
//                                         hintText: "Enter your password",
//                                         onChanged: (String? data) {
//                                           if (controller.isOneTimeButtonPress.value) {
//                                             controller.validationNewPassPage();
//                                           }
//                                         },
//                                         obscureText: !controller.isPassVisible.value,
//                                         suffixIcon: controller.isPassVisible.value
//                                             ? IconAsset.openEyeSVG
//                                             : IconAsset.closeEyeSVG,
//                                         onTap: () {
//                                           controller.isPassVisible.toggle();
//                                         },
//                                         validationText: controller.errorPasswordText.value,
//                                       );
//                                     }),
//                                     12.h.verticalSpace,
//                                     Obx(() {
//                                       return CustomTextField(
//                                         controller: controller.confirmPasswordTxtController,
//                                         title: "Re-enter Password",
//                                         hintText: "Confirm password",
//                                         onChanged: (String? data) {
//                                           if (controller.isOneTimeButtonPress.value) {
//                                             controller.validationNewPassPage();
//                                           }
//                                         },
//                                         obscureText: !controller.isConfirmPassVisible.value,
//                                         suffixIcon: controller.isConfirmPassVisible.value
//                                             ? IconAsset.openEyeSVG
//                                             : IconAsset.closeEyeSVG,
//                                         onTap: () {
//                                           controller.isConfirmPassVisible.toggle();
//                                         },
//                                         validationText: controller.errorConfirmPasswordText.value,
//                                       );
//                                     }),
//                                     // if (kDebugMode) ...[
//                                     //   50.h.verticalSpace,
//                                     //   InkWell(
//                                     //     onTap: () {
//                                     //       Navigation.replaceAll(Routes.subscriptionScreen);
//                                     //     },
//                                     //     child: AppText(
//                                     //       "subscription screen",
//                                     //       textAlign: TextAlign.center,
//                                     //       fontSize: 22.sp,
//                                     //       fontWeight: FontWeight.w600,
//                                     //     ),
//                                     //   ),
//                                     //   12.h.verticalSpace,
//                                     //   CustomButton(
//                                     //     text: "payment success",
//                                     //     height: 40.h,
//                                     //     fontWeight: FontWeight.w400,
//                                     //     onTap: () {
//                                     //       VerificationBottomSheet.show(
//                                     //           title: "Payment Successful",
//                                     //           message:
//                                     //               "Thanks for subscribing to the monthly plan! Your monthly plan has been activated & you will receive an email confirmation shortly.",
//                                     //           onTap: () {});
//                                     //     },
//                                     //   ),
//                                     //   12.h.verticalSpace,
//                                     //   CustomButton(
//                                     //     text: "payment failed",
//                                     //     height: 40.h,
//                                     //     fontWeight: FontWeight.w400,
//                                     //     onTap: () {
//                                     //       VerificationBottomSheet.show(
//                                     //           title: "Payment Failed",
//                                     //           buttonType: 2,
//                                     //           message: "Payment didn't go through. Explore payment options.",
//                                     //           btnText: "Change Payment Option",
//                                     //           secondaryBtnOnTap: () {
//                                     //             Get.back();
//                                     //           },
//                                     //           secondaryBtnTxt: "Cancel",
//                                     //           onTap: () {});
//                                     //     },
//                                     //   ),
//                                     // ]
//                                   ],
//                                 ).paddingSymmetric(horizontal: 16).paddingOnly(bottom: 125.h),
//                               ),
//                             );
//                           },
//                         ),
//                         Container(
//                           color: AppColors.white,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                                 colors: [
//                                   AppColors.primaryColor.withOpacity(0.2),
//                                   AppColors.white.withOpacity(0.41),
//                                 ],
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 28.h),
//                                   child: CustomButton(
//                                     text: "Continue",
//                                     height: 40.h,
//                                     fontWeight: FontWeight.w400,
//                                     onTap: () {
//                                       controller.validationNewPassPage();
//                                       controller.onTapNewPassButton();
//                                     },
//                                   ),
//                                 ),
//                                 14.h.verticalSpace,
//                                 InkWell(
//                                   onTap: () {
//                                     Navigation.replaceAll(Routes.signInScreen);
//                                   },
//                                   splashColor: AppColors.transparent,
//                                   child: const AppText("Back"),
//                                 ),
//                                 16.h.verticalSpace,
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
