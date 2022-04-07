

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_login_api/extras/conts.dart';
import 'package:getx_login_api/models/response_item.dart';
import 'package:getx_login_api/models/user_data.dart';
import 'package:getx_login_api/network/login_repo.dart';
import 'package:getx_login_api/utils/extension.dart';

class LoginController extends GetxController {
  TextEditingController tEmail = TextEditingController();
  TextEditingController tPassword = TextEditingController();
  RxBool status = false.obs;

  void logIn(String email, String password) async {
    ResponseItem result =
        ResponseItem(data: null, message: errorText, status: false);
    result = await LoginRepo().userLogin(email, password);
    try {
      if (result.status) {
        if (result.data != null) {
          var data = Data.fromJson(result.data);
          Get.offNamed(Routes.HOMESCREEN);
        }
      } else {
        showAppSnackbar(result.message);
      }
    } catch (e) {
      showAppSnackbar(errorText);
    }

    update();
  }
}
