class SuccessModel {
  int? statusCode;
  String? status;
  String? message;

  SuccessModel({this.statusCode, this.status, this.message});

  SuccessModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StatusCode'] = statusCode;
    data['Status'] = status;
    data['Message'] = message;
    return data;
  }
}
