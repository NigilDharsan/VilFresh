class WalletHistoryModel {
  String? status;
  String? message;
  List<WalletHistoryData>? data;

  WalletHistoryModel({this.status, this.message, this.data});

  WalletHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <WalletHistoryData>[];
      json['Data'].forEach((v) {
        data!.add(new WalletHistoryData.fromJson(v));
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

class WalletHistoryData {
  String? createdDate;
  String? time;
  String? currency;
  String? amount;
  String? status;
  String? paymentMethod;

  WalletHistoryData(
      {this.createdDate,
      this.time,
      this.currency,
      this.amount,
      this.status,
      this.paymentMethod});

  WalletHistoryData.fromJson(Map<String, dynamic> json) {
    createdDate = json['Created_Date'];
    time = json['Time'];
    currency = json['Currency'];
    amount = json['Amount'];
    status = json['Status'];
    paymentMethod = json['Payment_Method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Created_Date'] = this.createdDate;
    data['Time'] = this.time;
    data['Currency'] = this.currency;
    data['Amount'] = this.amount;
    data['Status'] = this.status;
    data['Payment_Method'] = this.paymentMethod;
    return data;
  }
}
