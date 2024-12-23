import 'package:apna_wash/Binding/global_binding.dart';
import 'package:apna_wash/Routes/route_name.dart';
import 'package:apna_wash/View/Pages/otp_page.dart';
import 'package:get/get.dart';
import '../View/Pages/login_page.dart';
import '../View/Pages/home_page.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: RouteNames.kLoginScreen, page: () => const LoginPage(), binding: GlobalScreenBindings()),
    GetPage(name: RouteNames.kOtpScreen, page: () => OTPPage(), binding: GlobalScreenBindings()),
    GetPage(name: RouteNames.kHomeScreen, page: () => HomePage(), binding: GlobalScreenBindings())
  ];
}

Transition navigationTransaction = Transition.fadeIn;
