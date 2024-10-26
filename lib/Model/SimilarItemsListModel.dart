class SimilarItemListModel {
  String? status;
  String? message;
  List<SimilarItemListData>? data;

  SimilarItemListModel({this.status, this.message, this.data});

  SimilarItemListModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <SimilarItemListData>[];
      json['Data'].forEach((v) {
        data!.add(SimilarItemListData.fromJson(v));
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

class SimilarItemListData {
  String? itemID;
  String? itemCode;
  String? itemName;
  String? itemVariantID;
  String? itemVariantName;
  String? actualPrice;
  String? sellingPrice;
  String? image;

  SimilarItemListData(
      {this.itemID,
      this.itemCode,
      this.itemName,
      this.itemVariantID,
      this.itemVariantName,
      this.actualPrice,
      this.sellingPrice,
      this.image});

  SimilarItemListData.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    itemCode = json['Item_Code'];
    itemName = json['Item_Name'];
    itemVariantID = json['Item_variant_ID'];
    itemVariantName = json['Item_variant_Name'];
    actualPrice = json['Actual_Price'];
    sellingPrice = json['Selling_Price'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Item_ID'] = itemID;
    data['Item_Code'] = itemCode;
    data['Item_Name'] = itemName;
    data['Item_variant_ID'] = itemVariantID;
    data['Item_variant_Name'] = itemVariantName;
    data['Actual_Price'] = actualPrice;
    data['Selling_Price'] = sellingPrice;
    data['Image'] = image;
    return data;
  }
}
