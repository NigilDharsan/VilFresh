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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['StatusCode'] = statusCode;
    data['Message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Identity'] = identity;
    data['Issues'] = issues;
    return data;
  }
}
