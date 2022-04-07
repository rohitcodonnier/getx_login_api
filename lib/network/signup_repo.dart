import 'package:getx_login_api/extras/base_api_helper.dart';

import 'package:getx_login_api/extras/req_conts.dart';
import 'package:getx_login_api/models/response_item.dart';

class SingUpRepo {
  Future<ResponseItem> userRegister({
    required String name,
    required String userName,
    required String email,
    required String password,
  }) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = "";

    var params = {
      "full_name": name,
      "user_name": userName,
      "email": email,
      "firebase_chat_id": "userUid",
      "password": password,
      "login_type": "email",
    };

    var queryParameters = {RequestParam.service: MethodNames.register};
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = Appurls.BASE_URL + queryString;

    result = await BaseApiHelper.postRequest(requestUrl, params, false);
    status = result.status;
    data = result.data;
    message = result.message;

    return ResponseItem(data: data, message: message, status: status);
  }
}
