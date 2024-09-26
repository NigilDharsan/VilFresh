class OrderHistoryDetailModel {
  String? status;
  String? message;
  List<Data>? data;

  OrderHistoryDetailModel({this.status, this.message, this.data});

  OrderHistoryDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? headerID;
  String? userID;
  String? netAmount;
  String? discountAmount;
  String? grossAmount;
  String? slotTime;
  String? coupenCode;
  String? platformFee;
  List<ItemDetails>? itemDetails;

  Data(
      {this.headerID,
      this.userID,
      this.netAmount,
      this.discountAmount,
      this.grossAmount,
      this.slotTime,
      this.coupenCode,
      this.platformFee,
      this.itemDetails});

  Data.fromJson(Map<String, dynamic> json) {
    headerID = json['Header_ID'];
    userID = json['User_ID'];
    netAmount = json['Net_Amount'];
    discountAmount = json['Discount_Amount'];
    grossAmount = json['Gross_Amount'];
    slotTime = json['Slot_Time'];
    coupenCode = json['Coupen_Code'];
    platformFee = json['Platform_fee'];
    if (json['Item_Details'] != null) {
      itemDetails = <ItemDetails>[];
      json['Item_Details'].forEach((v) {
        itemDetails!.add(new ItemDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Header_ID'] = this.headerID;
    data['User_ID'] = this.userID;
    data['Net_Amount'] = this.netAmount;
    data['Discount_Amount'] = this.discountAmount;
    data['Gross_Amount'] = this.grossAmount;
    data['Slot_Time'] = this.slotTime;
    data['Coupen_Code'] = this.coupenCode;
    data['Platform_fee'] = this.platformFee;
    if (this.itemDetails != null) {
      data['Item_Details'] = this.itemDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemDetails {
  String? itemID;
  String? itemName;
  String? variantID;
  String? variantName;
  String? quantity;
  String? itemPrice;
  String? amount;

  ItemDetails(
      {this.itemID,
      this.itemName,
      this.variantID,
      this.variantName,
      this.quantity,
      this.itemPrice,
      this.amount});

  ItemDetails.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    itemName = json['Item_Name'];
    variantID = json['Variant_ID'];
    variantName = json['Variant_Name'];
    quantity = json['Quantity'];
    itemPrice = json['Item_Price'];
    amount = json['Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_ID'] = this.itemID;
    data['Item_Name'] = this.itemName;
    data['Variant_ID'] = this.variantID;
    data['Variant_Name'] = this.variantName;
    data['Quantity'] = this.quantity;
    data['Item_Price'] = this.itemPrice;
    data['Amount'] = this.amount;
    return data;
  }
}
