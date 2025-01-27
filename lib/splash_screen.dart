import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Utils/Const/assets.dart';
import 'Utils/navigation_utils/routes.dart';
import 'utils/navigation_utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      navigateFurther();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey("Container"),
      width: double.maxFinite,
      child: Center(
        child: SvgPicture.asset(IconAsset.logoBlackSVG),
      ),
    );
  }

  Future<void> navigateFurther() async {
    Navigation.replace(Routes.logInScreen);
  }
}
