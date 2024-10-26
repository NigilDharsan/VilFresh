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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Item_ID'] = itemID;
    data['Item_Name'] = itemName;
    data['Category_ID'] = categoryID;
    data['Category_Name'] = categoryName;
    data['Image'] = image;
    data['Type'] = type;
    return data;
  }
}
