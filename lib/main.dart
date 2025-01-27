
import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'Utils/preferences/preference_manager.dart';
import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {

  // await Firebase.initializeApp();
  // await FireBaseNotification().setUpLocalNotification();
  // FirebaseAnalyticsUtils().init();
  // FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  runZonedGuarded<void>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await AppPreference().initialAppPreference();
    // await crashlytics.setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = crashlytics.recordFlutterError;
    runApp(const MyApp());
  }, (error, stack) {
    log("Error", error: error, stackTrace: stack);
  });
  // crashlytics.recordError(error, stack));
}
