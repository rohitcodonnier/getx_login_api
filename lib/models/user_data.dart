import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.data,
    required this.msg,
    required this.status,
  });

  Data data;
  String msg;
  int status;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        data: Data.fromJson(json["data"]),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "msg": msg,
        "status": status,
      };
}

class Data {
  Data({
    required this.userId,
    required this.userToken,
    required this.userName,
    required this.fullName,
    required this.email,
    required this.profileImages,
    required this.userLatitude,
    required this.userLongitude,
    required this.socialId,
    required this.firebaseChatId,
    required this.loginType,
    required this.authToken,
    required this.devicePushToken,
    required this.deviceType,
    required this.verifyForgotCode,
    required this.badge,
    required this.otpVerify,
    required this.isLoggedOut,
  });

  int userId;
  String userToken;
  String userName;
  String fullName;
  String email;
  String profileImages;
  double userLatitude;
  double userLongitude;
  String socialId;
  String firebaseChatId;
  String loginType;
  String authToken;
  String devicePushToken;
  String deviceType;
  String verifyForgotCode;
  int badge;
  int otpVerify;
  int isLoggedOut;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"] ?? "",
        userToken: json["user_token"] ?? "",
        userName: json["user_name"] ?? "",
        fullName: json["full_name"] ?? "",
        email: json["email"] ?? "",
        profileImages: json["profile_images"] ?? "",
        userLatitude: json["user_latitude"].toDouble() ?? 0.0,
        userLongitude: json["user_longitude"].toDouble() ?? 0.0,
        socialId: json["social_id"] ?? "",
        firebaseChatId: json["firebase_chat_id"] ?? "",
        loginType: json["login_type"] ?? "",
        authToken: json["auth_token"] ?? "",
        devicePushToken: json["device_push_token"] ?? "",
        deviceType: json["device_type"] ?? "",
        verifyForgotCode: json["verify_forgot_code"] ?? "",
        badge: json["badge"] ?? "",
        otpVerify: json["otp_verify"] ?? "",
        isLoggedOut: json["is_logged_out"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_token": userToken,
        "user_name": userName,
        "full_name": fullName,
        "email": email,
        "profile_images": profileImages,
        "user_latitude": userLatitude,
        "user_longitude": userLongitude,
        "social_id": socialId,
        "firebase_chat_id": firebaseChatId,
        "login_type": loginType,
        "auth_token": authToken,
        "device_push_token": devicePushToken,
        "device_type": deviceType,
        "verify_forgot_code": verifyForgotCode,
        "badge": badge,
        "otp_verify": otpVerify,
        "is_logged_out": isLoggedOut,
      };
}
