import 'package:apna_wash/Controller/home_controller.dart';
import 'package:apna_wash/View/Pages/home_page.dart';
import 'package:get/get.dart';

import '../../app_binding.dart';
import '../../modules/authentication/view/sign_in/log_in_screen.dart';
import '../../modules/authentication/view/sign_up/sign_up_screen.dart';
import '../../splash_screen.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const transitionSpeed = Duration(milliseconds: 450);

  // get started
  static const String splash = '/splash';
  static const String logInScreen = '/logIn';
  static const String homeScreen = '/homeScreen';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      binding: AppBidding(),
      transition: defaultTransition,
      transitionDuration: transitionSpeed,
    ),
    GetPage<dynamic>(
      name: logInScreen,
      page: () => const LogInScreen(),
      binding: AppBidding(),
      transition: defaultTransition,
      transitionDuration: transitionSpeed,
    ),
    GetPage<dynamic>(
      name: homeScreen,
      page: () => HomePage(),
      binding: AppBidding(),
      transition: defaultTransition,
      transitionDuration: transitionSpeed,
    ),
  ];
}
