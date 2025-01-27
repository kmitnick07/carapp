import 'dart:async';

import 'package:apna_wash/modules/authentication/view/widget/otp_bottom_sheet.dart';
import 'package:dev_print/dev_print.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/navigation_utils/navigation.dart';
import '../../../Utils/navigation_utils/routes.dart';
import '../../../Utils/preferences/preference_manager.dart';
import '../../../Utils/preferences/preferences_key.dart';
import '../../../Utils/utils.dart';

class LogInController extends GetxController {
  TextEditingController phoneTxtController = TextEditingController();

  FocusNode phoneTextFieldFocusNode = FocusNode();

  RxString otpString = "".obs;
  RxString verificationCode = "".obs;

  RxnString errorPhoneText = RxnString();

  int timerSec = 60;

  RxInt remainingTime = 0.obs;

  RxBool isLoading = false.obs;
  RxBool isOneTimeButtonPress = false.obs;
  RxBool isValidateAllField = false.obs;
  RxBool isButtonDisable = true.obs;

  Timer timer = Timer(const Duration(seconds: 0), () {});

  @override
  void onInit() {
    isOneTimeButtonPress.value = false;
    remainingTime.value = timerSec;
    otpString.value = "";
    super.onInit();
  }

  @override
  void onClose() {
    reset();
    timer.cancel();
    super.onClose();
  }

  void reset() {
    isOneTimeButtonPress.value = false;
    otpString.value = "";
  }

  void validationLogInPage() {
    validatePhone();
  }

  void validatePhone() {
    errorPhoneText.value = GetUtils.isPhoneNumber(phoneTxtController.text)
        ? null
        : phoneTxtController.text.isEmpty
            ? "Phone number cannot be empty."
            : "Please enter a valid phone number.";
  }

  void onTapLogUpButton() {
    isOneTimeButtonPress.value = true;
    Utils.hideKeyboardInApp();
    isValidateAllField.value = errorPhoneText.value == null;
    if (isValidateAllField.value) {
      sendOTP();
      OtpBottomSheet.show();
      // logIn();
    }
  }

  Future<void> logIn() async {
    Utils.hideKeyboardInApp();

    try {
      isLoading.value = true;

      // var result = await AuthService.signUp(SignUpFormData(
      //   email: emailTxtController.text,
      //   password: passwordTxtController.text,
      // ));
      isLoading.value = false;
      // Navigation.replaceAll(Routes.subscriptionScreen);
      reset();
    } catch (e) {
      devPrint(e);
    } finally {
      if (isLoading.value) isLoading.value = false;
    }
  }

  void reStartTimer() {
    timer.cancel();
    remainingTime.value = timerSec;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void handleOtpButtonDisable() {
    isButtonDisable.value = otpString.value.length != 6;
  }

  void sendOTP() async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${phoneTxtController.text}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', e.message ?? "Verification failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationCode.value = verificationId;
          // Navigation.pushNamed(Routes.kOtpScreen);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationCode.value = verificationId;
        },
      );
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }

  void verifyOTP() async {
    isLoading.value = true;
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationCode.value,
        smsCode: otpString.value,

      );
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
        if (value.user != null) {
          Navigation.replaceAll(Routes.homeScreen);
          await AppPreference().setString(PreferencesKey.userId, value.user!.uid);
          reset();
          // Navigation.pushNamed(Routes.kHomeScreen);
        }
      });
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }
}
