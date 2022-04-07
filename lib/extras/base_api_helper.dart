import 'dart:convert';
import 'dart:developer';

import 'dart:io';

import 'package:getx_login_api/extras/api_exception.dart';
import 'package:getx_login_api/extras/conts.dart';
import 'package:getx_login_api/models/response_item.dart';
import 'package:http/http.dart' as http;

class BaseApiHelper {
  static Future<ResponseItem> postRequest(String requestUrl,
      Map<String, dynamic> requestData, bool passAuthToken) async {
    log("request:" + requestUrl);
    log("headers:" + requestHeader(passAuthToken).toString());
    log("body:" + json.encode(requestData));
    return await http
        .post(Uri.parse(requestUrl),
            body: json.encode(requestData),
            headers: requestHeader(passAuthToken))
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> onValue(http.Response response) async{
    ResponseItem result;
    final ResponseItem responseData =
        ResponseItem.fromJson(json.decode(response.body));
    bool status = false;
    String message;
    dynamic data = responseData;
    log("responseCode: ${response.statusCode}", name: "response");
    if (response.statusCode == 200) {
      message = responseData.message;
      if (responseData.status) {
        status = true;
        data = responseData.data;
      } else {
        log("logout: ${responseData.forceLogout}", name: 'loout');
      }
    } else {
      log("response: $data");
      message = "Something went wrong.";
    }
    result = ResponseItem(data: data, message: message, status: status);
    log("response: {data: ${result.data}, message: $message, status: $status}");
    log("message: ${result.message}", name: 'message');

    return result;
  }

  static onError(error) {
    log("Error caused: " + error.toString());
    bool status = false;
    String message = "Unsuccessful request";
    if (error is SocketException) {
      message = ResponseException("No internet connection").toString();
    } else if (error is FormatException) {
      message = ResponseException("Something wrong in response.").toString() +
          error.toString();
    }
    return ResponseItem(data: null, message: message, status: status);
  }
}
