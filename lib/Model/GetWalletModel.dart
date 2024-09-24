class GetWalletModel {
  String? status;
  String? message;
  List<Balance>? balance;

  GetWalletModel({this.status, this.message, this.balance});

  GetWalletModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Balance'] != null) {
      balance = <Balance>[];
      json['Balance'].forEach((v) {
        balance!.add(new Balance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.balance != null) {
      data['Balance'] = this.balance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Balance {
  String? balance;
  String? platformFee;

  Balance({this.balance, this.platformFee});

  Balance.fromJson(Map<String, dynamic> json) {
    balance = json['Balance'];
    platformFee = json['PlatformFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Balance'] = this.balance;
    data['PlatformFee'] = this.platformFee;
    return data;
  }
}
