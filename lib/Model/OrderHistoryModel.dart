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
  String? headerID;
  String? orderID;
  String? orderedDate;
  String? deliveryDate;
  String? userID;
  String? totalItems;

  OrderHistoryData(
      {this.headerID,
      this.orderID,
      this.orderedDate,
      this.deliveryDate,
      this.userID,
      this.totalItems});

  OrderHistoryData.fromJson(Map<String, dynamic> json) {
    headerID = json['Header_ID'];
    orderID = json['Order_ID'];
    orderedDate = json['Ordered_Date'];
    deliveryDate = json['Delivery_Date'];
    userID = json['User_ID'];
    totalItems = json['Total_Items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Header_ID'] = this.headerID;
    data['Order_ID'] = this.orderID;
    data['Ordered_Date'] = this.orderedDate;
    data['Delivery_Date'] = this.deliveryDate;
    data['User_ID'] = this.userID;
    data['Total_Items'] = this.totalItems;
    return data;
  }
}
