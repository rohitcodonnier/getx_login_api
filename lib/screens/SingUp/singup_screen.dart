// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_login_api/screens/SingUp/singup_controller.dart';


class SingUpScreen extends StatelessWidget {
  SingUpController singUpController = Get.put(SingUpController());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sing Up"),
      ),
      body: GetBuilder<SingUpController>(builder: (ctrl) {
        return Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Name";
                        } else {
                          return null;
                        }
                      },
                      controller: ctrl.tName,
                      decoration: const InputDecoration(
                          hintText: "Name", border: OutlineInputBorder()),
                    )),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter User name";
                        } else {
                          return null;
                        }
                      },
                      controller: ctrl.tUserName,
                      decoration: const InputDecoration(
                          hintText: "User Name", border: OutlineInputBorder()),
                    )),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: validateEmail,
                      controller: ctrl.tEmail,
                      decoration: const InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                    )),
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
                      obscureText: !ctrl.pStatus.value,
                      controller: ctrl.tPassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                ctrl.pStatus.value = !ctrl.pStatus.value;
                              },
                              icon: Icon(ctrl.pStatus.value
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye)),
                          hintText: "Passowrd",
                          border: const OutlineInputBorder()),
                    ))),
                Obx(
                  () => Container(
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
                        obscureText: !ctrl.cPstatus.value,
                        controller: ctrl.tConfirmPassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  ctrl.cPstatus.value = !ctrl.cPstatus.value;
                                },
                                icon: Icon(ctrl.cPstatus.value
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye)),
                            hintText: "Confirm Password",
                            border: const OutlineInputBorder()),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CupertinoButton(
                    child: const Text("Sing Up"),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        ctrl.registerUser();
                      } else {
                        log("NOT VALIDATE", name: "Validation");
                      }
                    },
                    color: Colors.lightBlue,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 20),
                      child: const Text(
                        "Already have Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, top: 20),
                        child: const Text(
                          " Log IN",
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
          ),
        );
      }),
    );
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Email Address';
    }
    log(singUpController.tEmail.text);
    return null;
  }
}
