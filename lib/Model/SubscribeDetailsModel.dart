class SubscribeDetailsModel {
  String? status;
  String? message;
  List<Data>? data;

  SubscribeDetailsModel({this.status, this.message, this.data});

  SubscribeDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? variantID;
  String? variantName;
  String? uom;
  String? price;
  String? image;
  String? morningQty;
  String? eveningQty;
  String? subcriptionStatus;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_ID'] = this.itemID;
    data['Item_Name'] = this.itemName;
    data['Variant_ID'] = this.variantID;
    data['Variant_Name'] = this.variantName;
    data['Uom'] = this.uom;
    data['Price'] = this.price;
    data['Image'] = this.image;
    data['Morning_Qty'] = this.morningQty;
    data['Evening_Qty'] = this.eveningQty;
    data['Subcription_Status'] = this.subcriptionStatus;
    return data;
  }
}
