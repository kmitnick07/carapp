// import 'package:club_marea/modules/authentication/controller/sign_up_controller.dart';
// import 'package:club_marea/utils/app_colors.dart';
// import 'package:club_marea/utils/navigation_utils/navigation.dart';
// import 'package:club_marea/utils/navigation_utils/routes.dart';
// import 'package:club_marea/widget/custom_button.dart';
// import 'package:club_marea/widget/custom_textfield.dart';
// import 'package:dev_print/dev_print.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// import '../../../../utils/assets.dart';
// import '../../../../widget/annotated_region.dart';
// import '../../../../widget/app_text.dart';
//
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//         init: SignUpController(),
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
//                           AppColors.primaryColor.withOpacity(0.18),
//                           AppColors.white.withOpacity(0.41),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SafeArea(
//                     child: LayoutBuilder(
//                       builder: (context, constraint) {
//                         return ConstrainedBox(
//                           constraints: BoxConstraints(minHeight: constraint.maxHeight),
//                           child: Column(
//                             children: [
//                               SvgPicture.asset(IconAsset.logoBlackSVG).paddingOnly(top: 48),
//                               Expanded(
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     children: [
//                                       const AppText(
//                                         "Sign up",
//                                         textAlign: TextAlign.center,
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                       12.verticalSpace,
//                                       AppText(
//                                         "Sign up now to get start with us",
//                                         fontWeight: FontWeight.w400,
//                                         textAlign: TextAlign.center,
//                                         color: AppColors.textColor.withOpacity(0.7),
//                                       ),
//                                       40.verticalSpace,
//                                       Obx(() {
//                                         return CustomTextField(
//                                           controller: controller.firstNameTxtController,
//                                           title: "First Name",
//                                           hintText: "Enter name",
//                                           onChanged: (String? data) {
//                                             if (controller.isOneTimeButtonPress.value) {
//                                               controller.validationSignUpPage();
//                                             }
//                                           },
//                                           validationText: controller.errorFirstNameText.value,
//                                           suffixIcon: IconAsset.personSVG,
//                                         );
//                                       }),
//                                       14.verticalSpace,
//                                       Obx(() {
//                                         return CustomTextField(
//                                           controller: controller.emailTxtController,
//                                           title: "Email Address",
//                                           hintText: "Enter email",
//                                           inputFormatters: [
//                                             FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9@.]")),
//                                           ],
//                                           keyboardType: TextInputType.emailAddress,
//                                           onChanged: (String? data) {
//                                             if (controller.isOneTimeButtonPress.value) {
//                                               controller.validationSignUpPage();
//                                             }
//                                           },
//                                           validationText: controller.errorEmailText.value,
//                                           suffixIcon: IconAsset.mailSVG,
//                                         );
//                                       }),
//                                       14.verticalSpace,
//                                       Obx(() {
//                                         return CustomTextField(
//                                           controller: controller.phoneTxtController,
//                                           title: "Phone Number",
//                                           hintText: "Enter phone number",
//                                           inputFormatters: [
//                                             FilteringTextInputFormatter.allow(RegExp(r"[0-9+]")),
//                                           ],
//                                           keyboardType: TextInputType.phone,
//                                           onChanged: (String? data) {
//                                             if (controller.isOneTimeButtonPress.value) {
//                                               controller.validationSignUpPage();
//                                             }
//                                           },
//                                           validationText: controller.errorPhoneText.value,
//                                           suffixIcon: IconAsset.callSVG,
//                                         );
//                                       }),
//                                       14.verticalSpace,
//                                       Obx(() {
//                                         return CustomTextField(
//                                           controller: controller.passwordTxtController,
//                                           title: "Password",
//                                           hintText: "Enter password",
//                                           obscureText: !controller.isPassVisible.value,
//                                           onChanged: (String? data) {
//                                             if (controller.isOneTimeButtonPress.value) {
//                                               controller.validationSignUpPage();
//                                             }
//                                           },
//                                           validationText: controller.errorPasswordText.value,
//                                           suffixIcon: controller.isPassVisible.value
//                                               ? IconAsset.openEyeSVG
//                                               : IconAsset.closeEyeSVG,
//                                           onTap: () {
//                                             controller.isPassVisible.toggle();
//                                             if (controller.isOneTimeButtonPress.value) {
//                                               controller.validationSignUpPage();
//                                             }
//                                           },
//                                         );
//                                       }),
//                                       4.verticalSpace,
//                                       Obx(() {
//                                         bool isShowError = controller.errorTAndCText.value != null;
//                                         return Row(
//                                           children: [
//                                             Stack(
//                                               alignment: Alignment.centerLeft,
//                                               clipBehavior: Clip.none,
//                                               children: [
//                                                 Obx(() {
//                                                   return Checkbox(
//                                                     value: controller.isTermAndConditionCheck.value,
//                                                     activeColor: AppColors.primaryColor,
//                                                     side: const BorderSide(
//                                                         width: 1, color: AppColors.checkBoxBorderColor),
//                                                     shape:
//                                                         RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
//                                                     onChanged: (bool? value) {
//                                                       if (value != null) {
//                                                         controller.isTermAndConditionCheck.value = value;
//                                                         if (controller.isOneTimeButtonPress.value) {
//                                                           controller.validationSignUpPage();
//                                                         }
//                                                       }
//                                                     },
//                                                   );
//                                                 }),
//                                                 Positioned(
//                                                   left: 44,
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       RichText(
//                                                           textAlign: TextAlign.center,
//                                                           text: const TextSpan(children: [
//                                                             TextSpan(
//                                                               text: "I agree with ",
//                                                               style:
//                                                                   TextStyle(fontSize: 13, color: AppColors.textColor),
//                                                             ),
//                                                             TextSpan(
//                                                               text: "Terms & Conditions",
//                                                               style: TextStyle(
//                                                                   fontSize: 13,
//                                                                   decoration: TextDecoration.underline,
//                                                                   fontWeight: FontWeight.w600,
//                                                                   color: AppColors.black),
//                                                             ),
//                                                           ])),
//                                                       if (isShowError) ...[
//                                                         4.verticalSpace,
//                                                         Obx(() {
//                                                           return AppText(
//                                                             controller.errorTAndCText.value!,
//                                                             fontSize: 11,
//                                                             fontWeight: FontWeight.w400,
//                                                             color: AppColors.red,
//                                                           );
//                                                         }),
//                                                       ],
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         );
//                                       }),
//                                     ],
//                                   ).paddingOnly(top: 48),
//                                 ),
//                               ),
//                               ...[
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
//                                   child: CustomButton(
//                                     text: "Sign Up",
//                                     onTap: () {
//                                       controller.validationSignUpPage();
//                                       controller.onTapSignUpButton();
//                                     },
//                                   ),
//                                 ),
//                                 16.verticalSpace,
//                                 InkWell(
//                                   onTap: () {
//                                     devPrint("Sign in Clicked");
//                                     controller.reset();
//                                     Navigation.replaceAll(Routes.signInScreen);
//                                   },
//                                   splashColor: AppColors.transparent,
//                                   child: RichText(
//                                       textAlign: TextAlign.center,
//                                       text: const TextSpan(children: [
//                                         TextSpan(
//                                           text: "Already have an account? ",
//                                           style: TextStyle(fontSize: 12, color: AppColors.textColor),
//                                         ),
//                                         TextSpan(
//                                           text: "Sign in",
//                                           style: TextStyle(
//                                               fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
//                                         ),
//                                       ])),
//                                 ),
//                                 20.verticalSpace,
//                               ]
//                             ],
//                           ).paddingSymmetric(horizontal: 16),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
// // Widget _agreeWidget() {
// //   SignUpController _signUpController = Get.find();
// //   return Row(
// //     children: [
// //       Obx(() => Checkbox(
// //             checkColor: Colors.white,
// //             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
// //             value: _signUpController.termAndConditionCheck.value,
// //             shape: const CircleBorder(),
// //             onChanged: (bool? val) {
// //               _signUpController.termAndConditionCheck.value = val!;
// //               _signUpController.handleSignUpButtonDisable();
// //             },
// //           )),
// //       Expanded(
// //         child: RichText(
// //           text: TextSpan(
// //             children: <TextSpan>[
// //               TextSpan(
// //                 text: "I have read and agree to the ",
// //                 style: TextStyle(
// //                   fontSize: 12.sp,
// //                   fontWeight: FontWeight.w400,
// //                   color: AppColors.textColor,
// //                 ),
// //               ),
// //               TextSpan(
// //                 text: "App Account User Agreement ",
// //                 style: TextStyle(
// //                   fontSize: 12.sp,
// //                   fontWeight: FontWeight.w400,
// //                   color: AppColors.appThemeColor,
// //                 ),
// //               ),
// //               TextSpan(
// //                 text: "and ",
// //                 style: TextStyle(
// //                   fontSize: 12.sp,
// //                   fontWeight: FontWeight.w400,
// //                   color: AppColors.textColor,
// //                 ),
// //               ),
// //               TextSpan(
// //                 text: "Privacy Notice",
// //                 style: TextStyle(
// //                   fontSize: 12.sp,
// //                   fontWeight: FontWeight.w400,
// //                   color: AppColors.appThemeColor,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       )
// //     ],
// //   );
// // }
// }
