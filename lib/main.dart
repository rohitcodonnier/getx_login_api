import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login_api/extras/conts.dart';
import 'package:getx_login_api/extras/shared_prefrences.dart';
import 'package:getx_login_api/screens/Login/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  await preferences.putAppDeviceInfo();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      getPages: Routes.pages,
    );
  }
}
