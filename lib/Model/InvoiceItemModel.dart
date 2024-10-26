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
        data!.add(InvoiceItemData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    data['StatusCode'] = statusCode;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Item_ID'] = itemID;
    data['Variant_ID'] = variantID;
    data['Item_Name'] = itemName;
    data['variant_Name'] = variantName;
    return data;
  }
}
