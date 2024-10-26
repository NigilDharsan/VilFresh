class SubscribedItemDetailsModel {
  String? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  SubscribedItemDetailsModel(
      {this.status, this.statusCode, this.message, this.data});

  SubscribedItemDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'] == "True" ? "true" : "false";
    statusCode = json['StatusCode'];
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
    data['StatusCode'] = statusCode;
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
  String? variantID;
  String? variantName;
  String? date;
  String? day;
  String? morningQty;
  String? eveningQty;
  String? iD;
  String? morningYesNo;
  String? eveningYesNo;
  bool? isEdit;

  Data(
      {this.itemID,
      this.itemName,
      this.variantID,
      this.variantName,
      this.date,
      this.day,
      this.morningQty,
      this.eveningQty,
      this.iD,
      this.morningYesNo,
      this.eveningYesNo,
      this.isEdit});

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
    morningYesNo = json['Morning_YesNo'];
    eveningYesNo = json['Evening_YesNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Item_ID'] = itemID;
    data['Item_Name'] = itemName;
    data['Variant_ID'] = variantID;
    data['Variant_Name'] = variantName;
    data['Date'] = date;
    data['Day'] = day;
    data['Morning_Qty'] = morningQty;
    data['Evening_Qty'] = eveningQty;
    data['ID'] = iD;
    data['Morning_YesNo'] = morningYesNo;
    data['Evening_YesNo'] = eveningYesNo;
    return data;
  }
}
