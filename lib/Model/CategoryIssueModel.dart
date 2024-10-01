class CategoryIssueModel {
  String? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  CategoryIssueModel({this.status, this.statusCode, this.message, this.data});

  CategoryIssueModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    statusCode = json['StatusCode'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['StatusCode'] = this.statusCode;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? identity;
  String? issues;

  Data({this.identity, this.issues});

  Data.fromJson(Map<String, dynamic> json) {
    identity = json['Identity'];
    issues = json['Issues'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Identity'] = this.identity;
    data['Issues'] = this.issues;
    return data;
  }
}
