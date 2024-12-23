import 'package:apna_wash/View/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../Controller/login_controller.dart';
import '../../Utils/Theme/app_color.dart';

class OTPPage extends GetView<LoginController> {
  final pinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.kWhite),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: AppColor.kWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(height: 40),
              Pinput(
                length: 6,
                focusedPinTheme: pinTheme.copyDecorationWith(
                  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
                ),
                submittedPinTheme: pinTheme.copyWith(
                  decoration: pinTheme.decoration?.copyWith(
                    color: Color.fromRGBO(234, 239, 243, 1),
                  ),
                ),
                showCursor: true,
                onCompleted: (pin) => controller.verifyOTP(pin),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
