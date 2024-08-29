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
  String? categoryName;
  String? item;
  String? itemID;
  String? uom;
  String? itemImage;
  List<DefaultVariant>? defaultVariant;
  List<DefaultVariant>? allVariant;
  String? variantCount;

  CategoryData(
      {this.day,
      this.categoryName,
      this.item,
      this.itemID,
      this.uom,
      this.itemImage,
      this.defaultVariant,
      this.allVariant,
      this.variantCount});

  CategoryData.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    categoryName = json['Category_Name'];
    item = json['Item'];
    itemID = json['Item_ID'];
    uom = json['Uom'];
    itemImage = json['Item_Image'];
    if (json['Default_Variant'] != null) {
      defaultVariant = <DefaultVariant>[];
      json['Default_Variant'].forEach((v) {
        defaultVariant!.add(new DefaultVariant.fromJson(v));
      });
    }
    if (json['All_Variant'] != null) {
      allVariant = <DefaultVariant>[];
      json['All_Variant'].forEach((v) {
        allVariant!.add(new DefaultVariant.fromJson(v));
      });
    }
    variantCount = json['Variant_Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Category_Name'] = this.categoryName;
    data['Item'] = this.item;
    data['Item_ID'] = this.itemID;
    data['Uom'] = this.uom;
    data['Item_Image'] = this.itemImage;
    if (this.defaultVariant != null) {
      data['Default_Variant'] =
          this.defaultVariant!.map((v) => v.toJson()).toList();
    }
    if (this.allVariant != null) {
      data['All_Variant'] = this.allVariant!.map((v) => v.toJson()).toList();
    }
    data['Variant_Count'] = this.variantCount;
    return data;
  }
}

class DefaultVariant {
  String? itemQty;
  String? variantID;
  String? actualPrice;
  String? variantName;
  String? sellingPrice;

  DefaultVariant(
      {this.itemQty,
      this.variantID,
      this.actualPrice,
      this.variantName,
      this.sellingPrice});

  DefaultVariant.fromJson(Map<String, dynamic> json) {
    itemQty = json['Item_Qty'];
    variantID = json['Variant_ID'];
    actualPrice = json['Actual_price'];
    variantName = json['Variant_Name'];
    sellingPrice = json['Selling_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_Qty'] = this.itemQty;
    data['Variant_ID'] = this.variantID;
    data['Actual_price'] = this.actualPrice;
    data['Variant_Name'] = this.variantName;
    data['Selling_price'] = this.sellingPrice;
    return data;
  }
}
