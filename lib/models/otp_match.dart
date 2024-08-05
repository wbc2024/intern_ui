
class OtpMatch {
  String? message;
  String? accessToken;
  int? userId;
  String? otp;

  OtpMatch({this.message, this.accessToken, this.userId, this.otp});

  OtpMatch.fromJson(Map<String, dynamic> json) {
    this.message = json["message"];
    this.accessToken = json["access_token"];
    this.userId = json["user_id"];
    this.otp = json["otp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["message"] = this.message;
    data["access_token"] = this.accessToken;
    data["user_id"] = this.userId;
    data["otp"] = this.otp;
    return data;
  }
}