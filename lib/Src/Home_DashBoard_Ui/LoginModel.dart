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
        data!.add(new LoginData.fromJson(v));
      });
    }
    tokenID = json['TokenID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusCode'] = this.statusCode;
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['TokenID'] = this.tokenID;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profile_pic'] = this.profilePic;
    data['pinno'] = this.pinno;
    return data;
  }
}
