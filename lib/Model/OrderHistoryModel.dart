class OrderHistoryModel {
  String? status;
  String? message;
  List<OrderHistoryData>? data;

  OrderHistoryModel({this.status, this.message, this.data});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <OrderHistoryData>[];
      json['Data'].forEach((v) {
        data!.add(new OrderHistoryData.fromJson(v));
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

class OrderHistoryData {
  String? orderID;
  String? date;
  String? itemName;
  String? variantName;
  String? discount;
  String? quantity;
  String? rate;
  String? image;

  OrderHistoryData(
      {this.orderID,
        this.date,
        this.itemName,
        this.variantName,
        this.discount,
        this.quantity,
        this.rate,
        this.image});

  OrderHistoryData.fromJson(Map<String, dynamic> json) {
    orderID = json['Order_ID'];
    date = json['Date'];
    itemName = json['Item_Name'];
    variantName = json['Variant_Name'];
    discount = json['Discount'];
    quantity = json['Quantity'];
    rate = json['Rate'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Order_ID'] = this.orderID;
    data['Date'] = this.date;
    data['Item_Name'] = this.itemName;
    data['Variant_Name'] = this.variantName;
    data['Discount'] = this.discount;
    data['Quantity'] = this.quantity;
    data['Rate'] = this.rate;
    data['Image'] = this.image;
    return data;
  }
}
