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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['StatusCode'] = statusCode;
    data['Message'] = message;
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
  String? issueID;
  String? issueCategoryID;
  String? reopen;

  Data(
      {this.invoiceNo,
      this.itemDetails,
      this.issue,
      this.status,
      this.issueID,
      this.issueCategoryID,
      this.reopen});

  Data.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['Invoice_No'];
    itemDetails = json['Item_Details'];
    issue = json['Issue'];
    status = json['Status'];
    issueID = json['Issue_ID'];
    issueCategoryID = json['Issue_Category_ID'];
    reopen = json['Reopen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Invoice_No'] = invoiceNo;
    data['Item_Details'] = itemDetails;
    data['Issue'] = issue;
    data['Status'] = status;
    data['Issue_ID'] = issueID;
    data['Issue_Category_ID'] = issueCategoryID;
    data['Reopen'] = reopen;
    return data;
  }
}
