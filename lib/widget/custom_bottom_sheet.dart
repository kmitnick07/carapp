import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  static Future<void> show({
    required Widget child,
    bool? isDismissible,
  }) {
    return showModalBottomSheet(
      context: Get.context!,
      enableDrag: false,
      isDismissible: isDismissible ?? true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: child,
        );
      },
    );
  }
}
