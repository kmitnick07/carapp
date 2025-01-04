import 'dart:async';

import 'package:apna_wash/Controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Routes/route_name.dart';
import 'Component/apna_wash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 1), () async {
      Get.rootDelegate.history.clear();
      final loginController = Get.put(LoginController());
      bool isLoggedIn = await loginController.checkLoginStatus();
      isLoggedIn ? navigateTo(RouteNames.kHomeScreen) : navigateTo(RouteNames.kLoginScreen);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          clipBehavior: Clip.hardEdge,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: Colors.white, shape: BoxShape.rectangle),
          child: const ApnaWashLogo(
            size: 250,
            showName: true,
          ),
        ),
      ),
    );
  }
}
