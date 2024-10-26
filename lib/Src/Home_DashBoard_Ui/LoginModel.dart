class LoginModel {
  int? statusCode;
  String? status;
  String? message;
  List<LoginData>? data;
  String? tokenID;

  LoginModel(
      {this.statusCode, this.status, this.message, this.data, this.tokenID});

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <LoginData>[];
      json['Data'].forEach((v) {
        data!.add(LoginData.fromJson(v));
      });
    }
    tokenID = json['TokenID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StatusCode'] = statusCode;
    data['Status'] = status;
    data['Message'] = message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['TokenID'] = tokenID;
    return data;
  }
}

class LoginData {
  String? userId;
  String? name;
  String? email;
  String? phone;
  String? profilePic;
  String? pinno;

  LoginData(
      {this.userId,
      this.name,
      this.email,
      this.phone,
      this.profilePic,
      this.pinno});

  LoginData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    profilePic = json['profile_pic'];
    pinno = json['pinno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['profile_pic'] = profilePic;
    data['pinno'] = pinno;
    return data;
  }
}
