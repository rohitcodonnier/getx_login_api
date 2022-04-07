import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_login_api/extras/conts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Center(
        child: CupertinoButton(
            color: Colors.lightBlue,
            child: const Text("Log Out"),
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
            }),
      ),
    );
  }
}
