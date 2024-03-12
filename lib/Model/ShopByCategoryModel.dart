class ShopByCategoryModel {
  String? status;
  String? message;
  List<Data>? data;

  ShopByCategoryModel({this.status, this.message, this.data});

  ShopByCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
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
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? catgID;
  String? catgCode;
  String? catgName;
  String? catgImageURL;

  Data({this.catgID, this.catgCode, this.catgName, this.catgImageURL});

  Data.fromJson(Map<String, dynamic> json) {
    catgID = json['Catg_ID'];
    catgCode = json['Catg_Code'];
    catgName = json['Catg_Name'];
    catgImageURL = json['Catg_ImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Catg_ID'] = this.catgID;
    data['Catg_Code'] = this.catgCode;
    data['Catg_Name'] = this.catgName;
    data['Catg_ImageURL'] = this.catgImageURL;
    return data;
  }
}
