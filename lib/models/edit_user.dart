class EditUser {
  String? message;
  String? accessToken;
  int? userId;

  EditUser({this.message, this.accessToken, this.userId});

  EditUser.fromJson(Map<String, dynamic> json) {
    this.message = json["message"];
    this.accessToken = json["access_token"];
    this.userId = json["user_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["message"] = this.message;
    data["access_token"] = this.accessToken;
    data["user_id"] = this.userId;
    return data;
  }
}
