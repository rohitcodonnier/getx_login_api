import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferences = SharedPreference();

class SharedPreference {
  static SharedPreferences? _preferences;

  init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static const APP_DEVICE_TYPE = "App-Device-Type";
  static const APP_STORE_VERSION = "App-Store-Version";
  static const APP_DEVICE_MODEL = "App-Device-Model";
  static const APP_OS_VERSION = "App-Os-Version";
  static const APP_STORE_BUILD_NUMBER = "App-Store-Build-Number";
  static const AUTH_TOKEN = "Auth-Token";

  Future<bool?> putString(String key, String value) async {
    return _preferences == null ? null : _preferences!.setString(key, value);
  }

  String? getString(String key, {String defValue = ""}) {
    return _preferences == null
        ? defValue
        : _preferences!.getString(key) ?? defValue;
  }

  Future<bool?> putInt(String key, int value) async {
    return _preferences == null ? null : _preferences!.setInt(key, value);
  }

  int? getInt(String key, {int defValue = 0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getInt(key) ?? defValue;
  }

  Future<bool?> putBool(String key, bool value) async {
    return _preferences == null ? null : _preferences!.setBool(key, value);
  }

  bool? getBool(String key, {bool defValue = false}) {
    return _preferences == null
        ? defValue
        : _preferences!.getBool(key) ?? defValue;
  }

  putAppDeviceInfo() async {
    if (kIsWeb) {
      putString(APP_DEVICE_MODEL, "Test");
      putString(APP_OS_VERSION, "Web 1.0");
      putString(APP_STORE_VERSION, "1.0.0");
      putString(APP_STORE_BUILD_NUMBER, "1.0.0");
      putString(APP_DEVICE_TYPE, "web");
    } else {
      bool isiOS = Platform.isIOS;
      putString(APP_DEVICE_TYPE, isiOS ? "iOS" : "android");
      var deviceInfo = await appDeviceInfo();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      if (isiOS) {
        IosDeviceInfo iosDeviceInfo = (deviceInfo as IosDeviceInfo);
        putString(APP_DEVICE_MODEL, deviceInfo.model ?? "");
        putString(APP_OS_VERSION, "iOS ${iosDeviceInfo.systemVersion}");
      } else {
        AndroidDeviceInfo androidDeviceInfo = (deviceInfo as AndroidDeviceInfo);
        putString(APP_DEVICE_MODEL, androidDeviceInfo.model ?? "");
        putString(APP_OS_VERSION, androidDeviceInfo.version.release ?? "");
      }
      putString(APP_STORE_VERSION, packageInfo.version);
      putString(APP_STORE_BUILD_NUMBER, packageInfo.buildNumber);
    }
  }

  Future<dynamic> appDeviceInfo() async {
    return Platform.isIOS
        ? await DeviceInfoPlugin().iosInfo
        : await DeviceInfoPlugin().androidInfo;
  }
}
