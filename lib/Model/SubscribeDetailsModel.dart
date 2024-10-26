class SubscribeDetailsModel {
  String? status;
  String? message;
  List<SubscribeData>? data;

  SubscribeDetailsModel({this.status, this.message, this.data});

  SubscribeDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <SubscribeData>[];
      json['Data'].forEach((v) {
        data!.add(SubscribeData.fromJson(v));
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

class SubscribeData {
  String? itemID;
  String? itemName;
  String? variantID;
  String? variantName;
  String? uom;
  String? price;
  String? image;
  String? morningQty;
  String? eveningQty;
  String? subcriptionStatus;

  SubscribeData(
      {this.itemID,
      this.itemName,
      this.variantID,
      this.variantName,
      this.uom,
      this.price,
      this.image,
      this.morningQty,
      this.eveningQty,
      this.subcriptionStatus});

  SubscribeData.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    itemName = json['Item_Name'];
    variantID = json['Variant_ID'];
    variantName = json['Variant_Name'];
    uom = json['Uom'];
    price = json['Price'];
    image = json['Image'];
    morningQty = json['Morning_Qty'];
    eveningQty = json['Evening_Qty'];
    subcriptionStatus = json['Subcription_Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Item_ID'] = itemID;
    data['Item_Name'] = itemName;
    data['Variant_ID'] = variantID;
    data['Variant_Name'] = variantName;
    data['Uom'] = uom;
    data['Price'] = price;
    data['Image'] = image;
    data['Morning_Qty'] = morningQty;
    data['Evening_Qty'] = eveningQty;
    data['Subcription_Status'] = subcriptionStatus;
    return data;
  }
}
