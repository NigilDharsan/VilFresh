class SubscribedItemModel {
  String? message;
  String? status;
  int? statusCode;
  List<Data>? data;

  SubscribedItemModel({this.message, this.status, this.statusCode, this.data});

  SubscribedItemModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
    statusCode = json['StatusCode'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Status'] = this.status;
    data['StatusCode'] = this.statusCode;
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
  String? fromDate;
  String? toDate;

  Data(
      {this.itemID,
        this.itemName,
        this.variantID,
        this.variantName,
        this.fromDate,
        this.toDate});

  Data.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    itemName = json['Item_Name'];
    variantID = json['variant_ID'];
    variantName = json['variant_Name'];
    fromDate = json['From_Date'];
    toDate = json['To_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_ID'] = this.itemID;
    data['Item_Name'] = this.itemName;
    data['variant_ID'] = this.variantID;
    data['variant_Name'] = this.variantName;
    data['From_Date'] = this.fromDate;
    data['To_Date'] = this.toDate;
    return data;
  }
}
