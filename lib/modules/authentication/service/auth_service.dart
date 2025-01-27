import 'dart:convert';
import 'dart:developer';

import '../../../Utils/Const/api_constants.dart';
import '../../../api/api.dart';
import '../../../api/responce_handler.dart';
import '../models/signin_form_data.dart';
import '../models/signup_form_data.dart';
import '../models/user_data_response.dart';

class AuthService {
  static Future signUp(SignUpFormData request) async {
    try {
      var result =
          await Api().post(ApiConstants.signUpURL, bodyData: request.toJson());
      log("status: ${result.statusCode} body:${result.body}");
      await ResponseHandler.checkResponseError(result);
      return UserDataResponse.fromJson(
                  jsonDecode(utf8.decode(result.bodyBytes))["apiresponse"])
              .data
              ?.userExist ??
          false;
    } catch (e) {
      log("error : E $e");
      rethrow;
    }
  }

  static Future signIn(SignInFormData request) async {
    try {
      var result =
          await Api().post(ApiConstants.signInURL, bodyData: request.toJson());
      log("status: ${result.statusCode} body:${result.body}");
      await ResponseHandler.checkResponseError(result);
    } catch (e) {
      log("error : E $e");
      rethrow;
    }
  }
}
