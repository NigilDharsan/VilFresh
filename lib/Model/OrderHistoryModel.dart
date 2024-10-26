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
        data!.add(OrderHistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
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
  String? Rating;
  String? Remarks;

  OrderHistoryData(
      {this.headerID,
      this.orderID,
      this.orderedDate,
      this.deliveryDate,
      this.userID,
      this.totalItems,
      this.Rating,
      this.Remarks});

  OrderHistoryData.fromJson(Map<String, dynamic> json) {
    headerID = json['Header_ID'];
    orderID = json['Order_ID'];
    orderedDate = json['Ordered_Date'];
    deliveryDate = json['Delivery_Date'];
    userID = json['User_ID'];
    totalItems = json['Total_Items'];
    Rating = json['Rating'];
    Remarks = json['Remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Header_ID'] = headerID;
    data['Order_ID'] = orderID;
    data['Ordered_Date'] = orderedDate;
    data['Delivery_Date'] = deliveryDate;
    data['User_ID'] = userID;
    data['Total_Items'] = totalItems;
    data['Rating'] = Rating;
    data['Remarks'] = Remarks;

    return data;
  }
}
