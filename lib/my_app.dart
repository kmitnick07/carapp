import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Utils/Const/app_colors.dart';
import 'Utils/Const/app_string.dart';
import 'Utils/navigation_utils/routes.dart';
import 'Utils/utils.dart';
import 'app_binding.dart';
import 'generated/l10n.dart';
import 'language_change_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            // locale: Provider.of<LanguageChangeProvider>(context).currentLocal,
            // localizationsDelegates: const [
            //   S.delegate
            // ],
            title: AppString.appName,
            initialBinding: AppBidding(),
            initialRoute: Routes.splash,
            getPages: Routes.pages,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
              scaffoldBackgroundColor: AppColors.scaffoldBackground,
            ),
            themeMode: ThemeMode.light,
            builder: (context, child) {
              return Scaffold(
                body: GestureDetector(
                  onTap: () {
                    Utils.hideKeyboardInApp();
                  },
                  child: child,
                ),
              );
            },
          );
        },
      );
    });
  }
}
