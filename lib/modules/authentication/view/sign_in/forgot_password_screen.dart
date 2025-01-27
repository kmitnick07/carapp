// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
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
//
// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});
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
//                     child: LayoutBuilder(
//                       builder: (context, constraint) {
//                         return ConstrainedBox(
//                           constraints: BoxConstraints(minHeight: constraint.maxHeight),
//                           child: Column(
//                             children: [
//                               SvgPicture.asset(IconAsset.logoBlackSVG).paddingSymmetric(vertical: 48),
//                               const AppText(
//                                 "Forgot Password",
//                                 textAlign: TextAlign.center,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               12.verticalSpace,
//                               AppText(
//                                 "Enter email to reset your password",
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.textColor.withOpacity(0.7),
//                               ),
//                               Expanded(
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     children: [
//                                       40.verticalSpace,
//                                       Obx(() {
//                                         return CustomTextField(
//                                           controller: controller.emailTxtController,
//                                           title: "Email Address",
//                                           hintText: "Enter your email",
//                                           inputFormatters: [
//                                             FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9@.]")),
//                                           ],
//                                           keyboardType: TextInputType.emailAddress,
//                                           onChanged: (String? data) {
//                                             if (controller.isOneTimeButtonPress.value) {
//                                               controller.validationForgotPassPage();
//                                             }
//                                           },
//                                           suffixIcon: IconAsset.mailSVG,
//                                           validationText: controller.errorEmailText.value,
//                                         );
//                                       }),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
//                                     child: CustomButton(
//                                       text: "Continue",
//                                       onTap: () {
//                                         controller.validationForgotPassPage();
//                                         controller.onTapForgotPassButton();
//                                       },
//                                     ),
//                                   ),
//                                   16.verticalSpace,
//                                   InkWell(
//                                     onTap: () {
//                                       controller.reset();
//                                       Navigation.replaceAll(Routes.signInScreen);
//                                     },
//                                     splashColor: AppColors.transparent,
//                                     child: const AppText("Back"),
//                                   ),
//                                   20.verticalSpace,
//                                 ],
//                               ).paddingOnly(top: 4),
//                             ],
//                           ).paddingSymmetric(horizontal: 18),
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
// }
