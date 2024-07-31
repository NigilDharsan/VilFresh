class CategoriesModel {
  String? status;
  String? message;
  List<CategoryData>? data;

  CategoriesModel({this.status, this.message, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <CategoryData>[];
      json['Data'].forEach((v) {
        data!.add(new CategoryData.fromJson(v));
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

class CategoryData {
  String? day;
  String? item;
  String? itemID;
  Null? uom;
  String? variant;
  String? CategoryName;
  String? actualPrice;
  String? sellingPrice;
  String? itemImage;

  CategoryData(
      {this.day,
      this.item,
      this.itemID,
      this.uom,
      this.variant,
      this.actualPrice,
      this.sellingPrice,
        this.CategoryName,
      this.itemImage});

  CategoryData.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    item = json['Item'];
    itemID = json['Item_ID'];
    uom = json['Uom'];
    variant = json['Variant'];
    CategoryName = json['Category_Name'];
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
    data['Category_Name'] = this.CategoryName;
    data['Actual_Price'] = this.actualPrice;
    data['Selling_Price'] = this.sellingPrice;
    data['Item_Image'] = this.itemImage;
    return data;
  }
}
