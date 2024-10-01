class HSListModel {
  String? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  HSListModel({this.status, this.statusCode, this.message, this.data});

  HSListModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    statusCode = json['StatusCode'];
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
    data['StatusCode'] = this.statusCode;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? invoiceNo;
  String? itemDetails;
  String? issue;
  String? status;

  Data({this.invoiceNo, this.itemDetails, this.issue, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['Invoice_No'];
    itemDetails = json['Item_Details'];
    issue = json['Issue'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Invoice_No'] = this.invoiceNo;
    data['Item_Details'] = this.itemDetails;
    data['Issue'] = this.issue;
    data['Status'] = this.status;
    return data;
  }
}
