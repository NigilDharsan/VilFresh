class CartModel {
  String? status;
  String? message;
  List<Data>? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
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
  String? sYSID;
  String? iTEMNAME;
  String? iTEMVARIANT;
  String? qty;
  String? image;
  String? totalAmt;
  String? totTaxAmt;
  String? totDisAmt;
  String? netAMt;
  String? itemID;
  String? itemVariantID;
  String? Delivery_Date;

  Data(
      {this.sYSID,
      this.iTEMNAME,
      this.iTEMVARIANT,
      this.qty,
      this.image,
      this.totalAmt,
      this.totTaxAmt,
      this.totDisAmt,
      this.netAMt,
      this.itemID,
      this.itemVariantID,
      this.Delivery_Date});

  Data.fromJson(Map<String, dynamic> json) {
    sYSID = json['SYS_ID'];
    iTEMNAME = json['ITEM_NAME'];
    iTEMVARIANT = json['ITEM_VARIANT'];
    qty = json['Qty'];
    image = json['Image'];
    totalAmt = json['Total_Amt'];
    totTaxAmt = json['Tot_Tax_Amt'];
    totDisAmt = json['Tot_Dis_Amt'];
    netAMt = json['Net_AMt'];
    itemID = json['Item_ID'];
    itemVariantID = json['Item_Variant_ID'];
    Delivery_Date = json['Delivery_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SYS_ID'] = this.sYSID;
    data['ITEM_NAME'] = this.iTEMNAME;
    data['ITEM_VARIANT'] = this.iTEMVARIANT;
    data['Qty'] = this.qty;
    data['Image'] = this.image;
    data['Total_Amt'] = this.totalAmt;
    data['Tot_Tax_Amt'] = this.totTaxAmt;
    data['Tot_Dis_Amt'] = this.totDisAmt;
    data['Net_AMt'] = this.netAMt;
    data['Item_ID'] = this.itemID;
    data['Item_Variant_ID'] = this.itemVariantID;
    data['Delivery_Date'] = this.Delivery_Date;
    return data;
  }
}
