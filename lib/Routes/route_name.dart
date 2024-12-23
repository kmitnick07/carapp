import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteNames {
  static const String kHomeScreen = "/home";
  static const String kLoginScreen = "/login";
  static const String kOtpScreen = "/otp";
}

navigateTo(name) {
  clearFocus();
  Get.offAllNamed(name);
}

clearFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

