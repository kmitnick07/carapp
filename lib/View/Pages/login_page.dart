import 'package:apna_wash/View/custom_scaffold.dart';
import 'package:apna_wash/widget/custom_button.dart';
import 'package:dev_print/dev_print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/login_controller.dart';
import '../../Utils/Theme/app_color.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.kWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 7,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset('assets/images/long_logo.jpg', width: 250),
              ),
              const SizedBox(height: 24),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 52,
                child: TextField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.number,
                  cursorColor: AppColor.primary,
                  style: TextStyle(fontSize: 18, color: AppColor.primaryText),
                  decoration: InputDecoration(
                      prefixText: '+91 ',
                      prefixStyle: TextStyle(
                          fontSize: 18, color: AppColor.secondarySoft),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                          fontSize: 16, color: AppColor.secondarySoft),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: AppColor.primary, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: AppColor.secondarySoft, width: 2.0),
                      )),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                  text: "hello",
                  height: 40,
                  width: double.maxFinite,
                  isButtonFilled: true,
                  onTap: () {
                    devPrint("hello");
                  }),
              Obx(
                () => SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: controller.isButtonEnabled.value &&
                            !controller.isLoading.value
                        ? controller.sendOTP
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.isButtonEnabled.value
                          ? AppColor.primary
                          : AppColor.secondaryExtraSoft,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(AppColor.kWhite),
                          )
                        : Text(
                            'Send OTP',
                            style: TextStyle(
                              fontSize: 16,
                              color: controller.isButtonEnabled.value
                                  ? AppColor.kWhite
                                  : AppColor.kWhite.withOpacity(0.5),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
