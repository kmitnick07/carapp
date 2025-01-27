import 'package:dev_print/dev_print.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/utils.dart';

class SignUpController extends GetxController {
  TextEditingController phoneTxtController = TextEditingController();

  FocusNode phoneTextFieldFocusNode = FocusNode();

  RxnString errorPhoneText = RxnString();

  RxBool isLoading = false.obs;
  RxBool isValidateAllField = false.obs;
  RxBool isOneTimeButtonPress = false.obs;

  @override
  void onInit() {
    if (kDebugMode) {
      // emailTxtController.text = "admin@clubmarea.com";
      // passwordTxtController.text = "Admin@123";
      // firstNameTxtController.text = "Admin";
      // phoneTxtController.text = "98796969";
    } else {
      phoneTxtController.clear();
    }
    super.onInit();
  }

  void reset() {
    phoneTxtController.clear();
  }

  void validationSignUpPage() {
    validatePhone();
  }

  void validatePhone() {
    errorPhoneText.value = GetUtils.isPhoneNumber(phoneTxtController.text)
        ? null
        : phoneTxtController.text.isEmpty
            ? "Phone number cannot be empty."
            : "Please enter a valid phone number.";
  }

  void onTapSignUpButton() {
    isOneTimeButtonPress.value = true;
    Utils.hideKeyboardInApp();
    isValidateAllField.value = errorPhoneText.value == null;
    if (isValidateAllField.value) {
      signUp();
    }
  }

  Future<void> signUp() async {
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
}
