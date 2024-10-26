class InvoiceModel {
  String? status;
  String? message;
  int? statusCode;
  List<InvoiceData>? data;

  InvoiceModel({this.status, this.message, this.statusCode, this.data});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    statusCode = json['StatusCode'];
    if (json['Data'] != null) {
      data = <InvoiceData>[];
      json['Data'].forEach((v) {
        data!.add(InvoiceData.fromJson(v));
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

class InvoiceData {
  String? orderedDate;
  String? headerID;
  String? orderID;
  String? deliveyDate;

  InvoiceData(
      {this.orderedDate, this.headerID, this.orderID, this.deliveyDate});

  InvoiceData.fromJson(Map<String, dynamic> json) {
    orderedDate = json['Ordered_Date'];
    headerID = json['Header_ID'];
    orderID = json['Order_ID'];
    deliveyDate = json['Delivey_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Ordered_Date'] = orderedDate;
    data['Header_ID'] = headerID;
    data['Order_ID'] = orderID;
    data['Delivey_Date'] = deliveyDate;
    return data;
  }
}
