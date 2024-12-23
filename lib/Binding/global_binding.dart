import 'package:apna_wash/Controller/login_controller.dart';
import 'package:get/get.dart';
import '../Controller/home_controller.dart';

class GlobalScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}