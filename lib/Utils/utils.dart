import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void hideKeyboardInApp({BuildContext? context}) {
    var currentFocus = FocusScope.of(context ?? Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
