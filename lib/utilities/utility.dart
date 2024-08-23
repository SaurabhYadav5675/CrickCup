import 'dart:convert';

import 'package:crick_cup/constants/app_colors.dart';
import 'package:crick_cup/model/api_response.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utility {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: AppColors.darkGrey.v900);
  }

  static bool nullCheckString(String val) {
    bool status = true;
    if (val.isEmpty) {
      status = false;
    } else if (val.toLowerCase() == "null") {
      status = false;
    }
    return status;
  }

  static String getResMessage(String response) {
    String error = "";
    if (response.isNotEmpty) {
      try {
        var apiResponse = ApiResponse.fromJson(jsonDecode(response));
        error = apiResponse.message.toString();
      } catch (e) {
        return error;
      }
    }
    return error;
  }

  static String getAuthToken() {
    String token = "";
/*    try {
      var userDetails = AppPreference.getUserData();
      if (userDetails.isNotEmpty) {
        UserData userData = UserData.fromJson(jsonDecode(userDetails));
        token = userData.token.toString();
      }
    } catch (e) {
      debugPrint("Token parsing error $e");
    }*/
    return token;
  }
}
