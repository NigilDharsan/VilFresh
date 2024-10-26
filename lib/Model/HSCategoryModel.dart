class HSCategoryModel {
  String? status;
  int? statusCode;
  String? message;
  List<HSCategoryData>? data;

  HSCategoryModel({this.status, this.statusCode, this.message, this.data});

  HSCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    statusCode = json['StatusCode'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <HSCategoryData>[];
      json['Data'].forEach((v) {
        data!.add(HSCategoryData.fromJson(v));
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

class HSCategoryData {
  String? hSID;
  String? hSCategory;

  HSCategoryData({this.hSID, this.hSCategory});

  HSCategoryData.fromJson(Map<String, dynamic> json) {
    hSID = json['HS_ID'];
    hSCategory = json['HS_Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['HS_ID'] = hSID;
    data['HS_Category'] = hSCategory;
    return data;
  }
}
