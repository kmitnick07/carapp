import 'package:flutter/foundation.dart';

BuildFor buildFor = BuildFor.dev;

class ApiConst {
  static String baseUrl = kDebugMode ? LocalUrl.sameer : deployUrl;

  static String deployUrl = buildFor.isDev
      ? 'https://apnawash.azurewebsites.net/api/'
      : buildFor.isUat
          ? "https://apnawash.azurewebsites.net/api/"
          : "https://apnawash.azurewebsites.net/api/";

  static String getAccTokenUrl = '$baseUrl/getaccesstoken';
  static String login = '$baseUrl/login';
  static String employeeLogin = '$baseUrl/employee/login';
  static String forgetPassword = '$baseUrl/forgotpasswordrequest';
  static String resetPassword = '$baseUrl/resetpassword';
  static String appVersion = '$baseUrl/appversion';
  static String loginData = '$baseUrl/logindata';
  static String logOut = '$baseUrl/logout';
  static String appInit = '$baseUrl/appinit';
}

class HeaderConstant {
  static const String apiKey = "240A-457B-853A-A0079862315F";
  static const String issuer = 'website';
}

class LocalUrl {
  static String sameer = "https://apnawash.azurewebsites.net/api/";
}

enum BuildFor {
  dev,
  uat,
  prod,
  ;

  bool get isDev => this == BuildFor.dev;

  bool get isUat => this == BuildFor.uat;

  bool get isProd => this == BuildFor.prod;
}
