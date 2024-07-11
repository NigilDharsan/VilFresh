class InsertSurveyModel {
  int? statusCode;
  String? status;
  String? message;

  InsertSurveyModel({this.statusCode, this.status, this.message});

  InsertSurveyModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusCode'] = this.statusCode;
    data['Status'] = this.status;
    data['Message'] = this.message;
    return data;
  }
}
