import 'package:get/get.dart';

import 'Controller/home_controller.dart';
import 'Controller/login_controller.dart';
import 'modules/authentication/controller/log_in_controller.dart';
import 'modules/authentication/controller/sign_up_controller.dart';

class AppBidding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInController>(() => LogInController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
