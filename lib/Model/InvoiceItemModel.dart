class InvoiceItemModel {
  String? status;
  String? message;
  int? statusCode;
  List<InvoiceItemData>? data;

  InvoiceItemModel({this.status, this.message, this.statusCode, this.data});

  InvoiceItemModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    statusCode = json['StatusCode'];
    if (json['Data'] != null) {
      data = <InvoiceItemData>[];
      json['Data'].forEach((v) {
        data!.add(new InvoiceItemData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    data['StatusCode'] = this.statusCode;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceItemData {
  String? itemID;
  String? variantID;
  String? itemName;
  String? variantName;

  InvoiceItemData(
      {this.itemID, this.variantID, this.itemName, this.variantName});

  InvoiceItemData.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    variantID = json['Variant_ID'];
    itemName = json['Item_Name'];
    variantName = json['variant_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_ID'] = this.itemID;
    data['Variant_ID'] = this.variantID;
    data['Item_Name'] = this.itemName;
    data['variant_Name'] = this.variantName;
    return data;
  }
}
