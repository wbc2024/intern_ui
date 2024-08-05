class UserInformation {
  List<User>? user;

  UserInformation({this.user});

  UserInformation.fromJson(Map<String, dynamic> json) {
    this.user = json["user"] == null
        ? null
        : (json["user"] as List).map((e) => User.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null)
      data["user"] = this.user?.map((e) => e.toJson()).toList();
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? company;
  String? accessToken;
  String? phone;
  String? otp;
  dynamic emailVerifiedAt;
  dynamic createdAt;
  String? updatedAt;
  Userphotos? userphotos;

  User(
      {this.id,
      this.name,
      this.email,
      this.company,
      this.accessToken,
      this.phone,
      this.otp,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.userphotos});

  User.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.email = json["email"];
    this.company = json["company"];
    this.accessToken = json["access_token"];
    this.phone = json["phone"];
    this.otp = json["otp"];
    this.emailVerifiedAt = json["email_verified_at"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
    this.userphotos = json["userphotos"] == null
        ? null
        : Userphotos.fromJson(json["userphotos"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["company"] = this.company;
    data["access_token"] = this.accessToken;
    data["phone"] = this.phone;
    data["otp"] = this.otp;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.userphotos != null) data["userphotos"] = this.userphotos?.toJson();
    return data;
  }
}

class Userphotos {
  int? id;
  String? userId;
  String? profilePhoto;
  dynamic nidFront;
  dynamic nidBack;
  dynamic license;
  dynamic chequeBook;
  dynamic rememberToken;
  dynamic createdAt;
  String? updatedAt;

  Userphotos(
      {this.id,
      this.userId,
      this.profilePhoto,
      this.nidFront,
      this.nidBack,
      this.license,
      this.chequeBook,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Userphotos.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.userId = json["user_id"];
    this.profilePhoto = json["profile_photo"];
    this.nidFront = json["nid_front"];
    this.nidBack = json["nid_back"];
    this.license = json["license"];
    this.chequeBook = json["cheque_book"];
    this.rememberToken = json["remember_token"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["profile_photo"] = this.profilePhoto;
    data["nid_front"] = this.nidFront;
    data["nid_back"] = this.nidBack;
    data["license"] = this.license;
    data["cheque_book"] = this.chequeBook;
    data["remember_token"] = this.rememberToken;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
