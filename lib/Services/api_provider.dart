import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dev_print/dev_print.dart';
import 'package:http/http.dart' as http;

import '../Config/config.dart';
import '../Config/encrypt_repo.dart';

bool isSessionExpired = false;

class ApiProvider {
  Future<dynamic> httpMethod({
    String? method = HttpMethod.get,
    String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? requestBody,
    // bool? showDialogs = true,
    bool? showSuccessToast = false,
  }) async {
    http.Response? response;
    Map<String, String> reqHeader = {};
    Map<String, dynamic> reqBody = {};

    try {
      // if (kIsWeb && !isSessionExpired && (Settings.isUserLogin && DateTime.now().difference(Settings.logoutTime) > Duration(minutes: Config.sessionTimeOutMinutes))) {
      //   isSessionExpired = true;
      //   await AuthRepo().onLogOut();
      // }

      if (!Config.isEncrypted) {
        reqHeader = headers ?? {};
      } else {
        // String encryptedHeader = EncryptRepo().encryptData(jsonEncode(headers));
        // reqHeader['reqheader'] = encryptedHeader;
      }
      reqHeader['content-type'] = 'application/json';

      if (!Config.isEncrypted) {
        reqBody = requestBody ?? {};
      } else {
        // String encryptedBody = EncryptRepo().encryptData(jsonEncode(requestBody));
        // reqBody['reqbody'] = encryptedBody;
      }

      if (method == HttpMethod.get) {
        response = await http.get(Uri.parse(url!.trim()), headers: reqHeader);
      } else if (method == HttpMethod.post) {
        response = await http.post(Uri.parse(url!.trim()), headers: reqHeader, body: jsonEncode(reqBody));
      } else if (method == HttpMethod.delete) {
        response = await http.delete(Uri.parse(url!.trim()), headers: reqHeader, body: jsonEncode(reqBody));
      }
      // if (response?.headers['token'] != null) {
      //   Settings.authToken = response!.headers['token'].toString();
      // } else if (response?.headers['key'] != null) {
      //   Settings.authToken = response!.headers['key'].toString();
      // }
      // if (response?.statusCode != 401) {
      //   Settings.logoutTime = DateTime.now();
      // }
      return _response(response!, url!, showSuccessToast!);
    } catch (e) {
      String errorMsg = "Failed to send request, Please check your internet connection and try again..!";
      devPrint(errorMsg);
      devPrint(e);
      dynamic data;

      /// removed by sahil - instruction by arpit
      // await Get.dialog(
      //   NoInternetDialog(
      //     onRetry: () async {
      //       data = await httpMethod(
      //         headers: headers,
      //         method: method,
      //         requestBody: requestBody,
      //         showDialogs: showDialogs,
      //         showSuccessToast: showSuccessToast,
      //         url: url,
      //       );
      //     },
      //   ),
      //   barrierColor: Colors.transparent,
      //   barrierDismissible: false,
      // );

      return data;
    }
  }

  dynamic _response(http.Response response, [String url = '', bool showSuccessToast = false]) async {
    // if (response.headers['token'] != null) {
    //   Settings.authToken = response.headers['token'].toString();
    // }
    // if (response.headers['unqkey'] != null) {
    //   Settings.unqKey = response.headers['unqkey'].toString();
    // }
    // if (response.headers['uid'] != null) {
    //   Settings.uid = response.headers['uid'].toString();
    // }

    log("-------------------> $url", name: "${response.statusCode}");

    switch (response.statusCode) {
      case 404:
        return {'status': 404, 'message': 'The requested URL was not found.'};
      default:
        return decryptedResponse(response.body);
    }
  }

  Map<String, dynamic> decryptedResponse(String body) {
    Map<String, dynamic> responseJson = {};
    try {
      String bodyString = body;
      if (Config.isEncrypted) {
        // bodyString = EncryptRepo().decryptedData(body);
      }
      if (!Config.isEncrypted) {
        responseJson = jsonDecode(bodyString);
      } else {
        responseJson = jsonDecode(jsonDecode(bodyString));
      }
    } catch (e) {
      return {};
    }

    return responseJson;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class HttpMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String delete = 'DELETE';
}
