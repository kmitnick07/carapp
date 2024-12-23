import 'package:apna_wash/Routes/route_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Binding/global_binding.dart';
import 'Controller/login_controller.dart';
import 'Routes/app_routes.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final loginController = Get.put(LoginController());
  bool isLoggedIn = await loginController.checkLoginStatus();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isLoggedIn});

  final bool? isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'APNAWASH',
      // theme: Style.themeData(context),
      initialRoute: isLoggedIn ?? false ? RouteNames.kHomeScreen : RouteNames.kLoginScreen,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalScreenBindings(),
      getPages: AppRoutes.pages,
      // unknownRoute: GetPage(
      //   name: RouteNames.kLoginScreen,
      //   transition: navigationTransaction,
      //   page: () => const LoginPage(),
      // ),
      // builder: (context, child) => LayoutTemplateView(child: child!),
      // scrollBehavior: MyCustomScrollBehavior().copyWith(overscroll: false),
    );
  }
}
