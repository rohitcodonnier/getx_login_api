
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_login_api/extras/req_conts.dart';
import 'package:getx_login_api/extras/shared_prefrences.dart';
import 'package:getx_login_api/screens/Login/login_screen.dart';
import 'package:getx_login_api/screens/SingUp/singup_screen.dart';
import 'package:getx_login_api/screens/home_screen.dart';

class Routes {
  static const LOGIN = "/login";
  static const String SIGNUP = "/signup";
  static const String HOMESCREEN = "/homescreen";

  static List<GetPage> pages = [
    GetPage(name: LOGIN, page: () => LoginScreen()),
    GetPage(name: SIGNUP, page: () => SingUpScreen()),
    GetPage(name: HOMESCREEN, page: () => const HomeScreen()),
  ];
}

const String errorText = "Something went wrong.";

Map<String, String> requestHeader(bool passAuthToken) {
  return {
    RequestHeaderKey.contentType: "application/json",
    RequestHeaderKey.appSecret: "meditation25481#\$@",
    RequestHeaderKey.appTrackVersion: "v1",
    RequestHeaderKey.appDeviceType:
        preferences.getString(SharedPreference.APP_DEVICE_TYPE) ?? '',
    RequestHeaderKey.appStoreVersion:
        preferences.getString(SharedPreference.APP_STORE_VERSION) ?? '',
    RequestHeaderKey.appDeviceModel:
        preferences.getString(SharedPreference.APP_DEVICE_MODEL) ?? '',
    RequestHeaderKey.appOsVersion:
        preferences.getString(SharedPreference.APP_OS_VERSION) ?? '',
    RequestHeaderKey.appStoreBuildNumber:
        preferences.getString(SharedPreference.APP_STORE_BUILD_NUMBER) ?? '',
    if (passAuthToken)
      RequestHeaderKey.authToken:
          preferences.getString(SharedPreference.AUTH_TOKEN) ?? '',
  };

}

