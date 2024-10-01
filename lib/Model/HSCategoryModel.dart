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
        data!.add(new HSCategoryData.fromJson(v));
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

class HSCategoryData {
  String? hSID;
  String? hSCategory;

  HSCategoryData({this.hSID, this.hSCategory});

  HSCategoryData.fromJson(Map<String, dynamic> json) {
    hSID = json['HS_ID'];
    hSCategory = json['HS_Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HS_ID'] = this.hSID;
    data['HS_Category'] = this.hSCategory;
    return data;
  }
}
