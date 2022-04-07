import 'package:getx_login_api/extras/base_api_helper.dart';
import 'package:getx_login_api/extras/req_conts.dart';
import 'package:getx_login_api/models/response_item.dart';

class LoginRepo {
  Future<ResponseItem> userLogin(
    String email,
    String password,
  ) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = "";

    var parms = {
      "email": email,
      "password": password,
    };

    var queryParameters = {RequestParam.service: MethodNames.login};
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = Appurls.BASE_URL + queryString;

    result = await BaseApiHelper.postRequest(requestUrl, parms, false);
    status = result.status;
    data = result.data;
    message = result.message;

    return ResponseItem(data: data, message: message, status: status);
  }
}
