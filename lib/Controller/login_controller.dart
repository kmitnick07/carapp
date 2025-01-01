import 'package:apna_wash/Routes/route_name.dart';
import 'package:dev_print/dev_print.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();

  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode otpFocusNode = FocusNode();

  final isLoading = false.obs;
  RxBool isButtonEnabled = false.obs;
  final isPhoneFocused = false.obs;
  final isOtpFocused = false.obs;
  final verificationCode = ''.obs;

  @override
  void onInit() {
    super.onInit();

    // Add focus listeners
    phoneFocusNode.addListener(() {
      isPhoneFocused.value = phoneFocusNode.hasFocus;
    });

    otpFocusNode.addListener(() {
      isOtpFocused.value = otpFocusNode.hasFocus;
    });

    phoneController.addListener(() {
      isButtonEnabled.value = phoneController.text.length == 10;
    });
  }

  @override
  void onClose() {
    phoneController.dispose();
    phoneFocusNode.dispose();
    otpFocusNode.dispose();
    super.onClose();
  }

  void unfocusAllFields() {
    phoneFocusNode.unfocus();
    otpFocusNode.unfocus();
  }

  void sendOTP() async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: kDebugMode ? '+919898232801' : '+91${phoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', e.message ?? "Verification failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationCode.value = verificationId;
          navigateTo(RouteNames.kOtpScreen);
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

  void verifyOTP(String pin) async {
    isLoading.value = true;
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationCode.value,
        smsCode: pin,
      );
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          saveUserData(value.user!.uid);
          navigateTo(RouteNames.kHomeScreen);
        }
      });
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }

  final isLoggedIn = false.obs;

  Future<void> saveUserData(String userID) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userID', userID);

    devPrint('User ID saved: ${prefs.getBool('isLoggedIn')}');

    isLoggedIn.value = true;
  }

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;

    return isLoggedIn.value;
    // if (isLoggedIn.value) {
    //   // Navigate to the home screen directly if the user is already logged in
    //   Get.offAllNamed('/home'); // Replace '/home' with your actual route
    // }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLoggedIn.value = false;
    navigateTo(RouteNames.kLoginScreen);
  }
}
