import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login_api/extras/conts.dart';
import 'package:getx_login_api/models/response_item.dart';
import 'package:getx_login_api/models/user_data.dart';
import 'package:getx_login_api/network/signup_repo.dart';
import 'package:getx_login_api/utils/extension.dart';

class SingUpController extends GetxController {
  TextEditingController tName = TextEditingController();
  TextEditingController tUserName = TextEditingController();
  TextEditingController tEmail = TextEditingController();
  TextEditingController tPassword = TextEditingController();
  TextEditingController tConfirmPassword = TextEditingController();

  RxBool pStatus = false.obs;
  RxBool cPstatus = false.obs;


  void registerUser() async {
    ResponseItem result =
        ResponseItem(data: null, message: errorText, status: false);
    result = await SingUpRepo().userRegister(
      name: tName.value.text.toString(),
      userName: tUserName.value.text.toString(),
      email: tEmail.value.text.trim().toString(),
      password: tPassword.value.text.trim().toString(),
    );

    try {
      if (result.status) {
        if (result.data != null) {
          var data = Data.fromJson(result.data);
          tName.clear();
          tUserName.clear();
          tEmail.clear();
          tPassword.clear();
          Get.offAllNamed(Routes.HOMESCREEN);
        }
      } else {
        showAppSnackbar(result.message);
      }
    } catch (e) {
      showAppSnackbar(result.message);
    }

    update();
  }
}
