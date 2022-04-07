import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login_api/extras/conts.dart';
import 'package:getx_login_api/screens/Login/login_controller.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: GetBuilder<LoginController>(builder: (ctrl) {
        return Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  controller: ctrl.tEmail,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Email"),
                ),
              ),
              Obx(() => Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Password";
                        } else if (value.length < 6) {
                          return "Password should be atleast 6 characters";
                        } else if (value.length > 15) {
                          return "Password should not be greater than 15 characters";
                        } else {
                          return null;
                        }
                      },
                      obscureText: !ctrl.status.value,
                      controller: ctrl.tPassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                ctrl.status.value = !ctrl.status.value;
                              },
                              icon: Icon(ctrl.status.value
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye)),
                          border: const OutlineInputBorder(),
                          hintText: "Enter Password"),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.all(10),
                child: CupertinoButton(
                    color: Colors.lightBlue,
                    child: const Text("Log in  "),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        ctrl.logIn(ctrl.tEmail.text, ctrl.tPassword.text);
                      } else {
                        log("NOT VALIDATE", name: "Validation");
                      }
                    }),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 20),
                    child: const Text(
                      "Don't have account ??",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.SIGNUP);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 20),
                      child: const Text(
                        " Sing Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.lightBlue),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Email Address';
    }
    log(loginController.tEmail.text);
    if (!loginController.tEmail.text.contains('@') &&
        !loginController.tEmail.text.endsWith('.com')) {
      return 'please enter valid email';
    }
    return null;
  }
}
