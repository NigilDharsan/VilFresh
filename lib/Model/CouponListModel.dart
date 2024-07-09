class CouponModel {
  String? status;
  String? message;
  List<Data>? data;

  CouponModel({this.status, this.message, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
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
  String? coupenID;
  String? coupenCode;
  String? coupenDesc;
  String? fromDate;
  String? toDate;
  String? rate;
  String? region;
  Null? date;

  Data(
      {this.coupenID,
        this.coupenCode,
        this.coupenDesc,
        this.fromDate,
        this.toDate,
        this.rate,
        this.region,
        this.date});

  Data.fromJson(Map<String, dynamic> json) {
    coupenID = json['Coupen_ID'];
    coupenCode = json['Coupen_Code'];
    coupenDesc = json['Coupen_Desc'];
    fromDate = json['From_Date'];
    toDate = json['To_Date'];
    rate = json['Rate'];
    region = json['Region'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Coupen_ID'] = this.coupenID;
    data['Coupen_Code'] = this.coupenCode;
    data['Coupen_Desc'] = this.coupenDesc;
    data['From_Date'] = this.fromDate;
    data['To_Date'] = this.toDate;
    data['Rate'] = this.rate;
    data['Region'] = this.region;
    data['Date'] = this.date;
    return data;
  }
}
