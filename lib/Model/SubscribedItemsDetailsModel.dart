class SubscribedItemDetailsModel {
  String? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  SubscribedItemDetailsModel(
      {this.status, this.statusCode, this.message, this.data});

  SubscribedItemDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    statusCode = json['StatusCode'];
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
    data['StatusCode'] = this.statusCode;
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
  String? date;
  String? day;
  String? morningQty;
  String? eveningQty;
  String? iD;

  Data(
      {this.itemID,
        this.itemName,
        this.variantID,
        this.variantName,
        this.date,
        this.day,
        this.morningQty,
        this.eveningQty,
        this.iD});

  Data.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    itemName = json['Item_Name'];
    variantID = json['Variant_ID'];
    variantName = json['Variant_Name'];
    date = json['Date'];
    day = json['Day'];
    morningQty = json['Morning_Qty'];
    eveningQty = json['Evening_Qty'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_ID'] = this.itemID;
    data['Item_Name'] = this.itemName;
    data['Variant_ID'] = this.variantID;
    data['Variant_Name'] = this.variantName;
    data['Date'] = this.date;
    data['Day'] = this.day;
    data['Morning_Qty'] = this.morningQty;
    data['Evening_Qty'] = this.eveningQty;
    data['ID'] = this.iD;
    return data;
  }
}
