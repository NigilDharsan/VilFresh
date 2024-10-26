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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['Status'] = status;
    data['StatusCode'] = statusCode;
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
  String? Image;

  Data(
      {this.itemID,
      this.itemName,
      this.variantID,
      this.variantName,
      this.fromDate,
      this.toDate,
      this.Image});

  Data.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    itemName = json['Item_Name'];
    variantID = json['variant_ID'];
    variantName = json['variant_Name'];
    fromDate = json['From_Date'];
    toDate = json['To_Date'];
    Image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Item_ID'] = itemID;
    data['Item_Name'] = itemName;
    data['variant_ID'] = variantID;
    data['variant_Name'] = variantName;
    data['From_Date'] = fromDate;
    data['To_Date'] = toDate;
    data['Image'] = Image;

    return data;
  }
}
