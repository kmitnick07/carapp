import 'package:dev_print/dev_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/Const/app_colors.dart';
import '../../../../Utils/Const/assets.dart';
import '../../../../widget/app_text.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_textfield.dart';
import '../../controller/log_in_controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LogInController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.primaryColor.withOpacity(0.18),
                      AppColors.white.withOpacity(0.41),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      constraints: BoxConstraints(minHeight: constraint.maxHeight),
                      child: Column(
                        children: [
                          SvgPicture.asset(IconAsset.logoBlackSVG, height: 90).paddingOnly(top: 52),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const AppText(
                                    "Log in",
                                    textAlign: TextAlign.center,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  12.verticalSpace,
                                  RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Welcome!",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.textColor.withOpacity(0.7)),
                                        ),
                                        TextSpan(
                                          text: " Please log in to access your account",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textColor.withOpacity(0.7)),
                                        ),
                                      ])).paddingSymmetric(horizontal: 45),
                                  40.verticalSpace,
                                  Obx(() {
                                    return CustomTextField(
                                      controller: controller.phoneTxtController,
                                      title: "Phone Number",
                                      hintText: "Enter phone number",
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(r"[0-9+]")),
                                      ],
                                      keyboardType: TextInputType.number,
                                      onChanged: (String? data) {
                                        if (controller.isOneTimeButtonPress.value) {
                                          controller.validationLogInPage();
                                        }
                                      },
                                      prefixStackedWidgetWidth: 48,
                                      prefixStackedWidget: CustomButton(
                                        text: "+91",
                                        fontSize: 14,
                                        height: 36,
                                        width: 48,
                                        onTap: () {},
                                      ),
                                      validationText: controller.errorPhoneText.value,
                                      suffixIcon: IconAsset.callSVG,
                                    );
                                  }),
                                ],
                              ).paddingOnly(top: 48),
                            ),
                          ),
                          ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                              child: CustomButton(
                                text: "Log In",
                                onTap: () {
                                  controller.validationLogInPage();
                                  controller.onTapLogUpButton();
                                },
                              ),
                            ),
                            20.verticalSpace,
                          ]
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
