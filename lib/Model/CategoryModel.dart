class CategoryModel {
  String? status;
  String? message;
  List<Data>? data;

  CategoryModel({this.status, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? day;
  String? item;
  String? itemID;
  Null? uom;
  String? variant;
  String? actualPrice;
  String? sellingPrice;
  String? itemImage;

  Data(
      {this.day,
      this.item,
      this.itemID,
      this.uom,
      this.variant,
      this.actualPrice,
      this.sellingPrice,
      this.itemImage});

  Data.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    item = json['Item'];
    itemID = json['Item_ID'];
    uom = json['Uom'];
    variant = json['Variant'];
    actualPrice = json['Actual_Price'];
    sellingPrice = json['Selling_Price'];
    itemImage = json['Item_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Item'] = this.item;
    data['Item_ID'] = this.itemID;
    data['Uom'] = this.uom;
    data['Variant'] = this.variant;
    data['Actual_Price'] = this.actualPrice;
    data['Selling_Price'] = this.sellingPrice;
    data['Item_Image'] = this.itemImage;
    return data;
  }
}
