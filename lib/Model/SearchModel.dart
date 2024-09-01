class SearchModel {
  String? status;
  String? message;
  List<Data>? data;

  SearchModel({this.status, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
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
  String? itemID;
  String? itemName;
  String? categoryID;
  String? categoryName;
  String? image;
  String? type;

  Data(
      {this.itemID,
      this.itemName,
      this.categoryID,
      this.categoryName,
      this.image,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    itemName = json['Item_Name'];
    categoryID = json['Category_ID'];
    categoryName = json['Category_Name'];
    image = json['Image'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_ID'] = this.itemID;
    data['Item_Name'] = this.itemName;
    data['Category_ID'] = this.categoryID;
    data['Category_Name'] = this.categoryName;
    data['Image'] = this.image;
    data['Type'] = this.type;
    return data;
  }
}
