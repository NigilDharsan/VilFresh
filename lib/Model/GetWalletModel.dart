class GetWalletModel {
  String? status;
  String? message;
  List<Balance>? balance;
  List<ReservedBalance>? reservedBalance;

  GetWalletModel(
      {this.status, this.message, this.balance, this.reservedBalance});

  GetWalletModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Balance'] != null) {
      balance = <Balance>[];
      json['Balance'].forEach((v) {
        balance!.add(Balance.fromJson(v));
      });
    }
    if (json['Reserved_Balance'] != null) {
      reservedBalance = <ReservedBalance>[];
      json['Reserved_Balance'].forEach((v) {
        reservedBalance!.add(ReservedBalance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    if (balance != null) {
      data['Balance'] = balance!.map((v) => v.toJson()).toList();
    }
    if (reservedBalance != null) {
      data['Reserved_Balance'] =
          reservedBalance!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Balance'] = balance;
    data['PlatformFee'] = platformFee;
    return data;
  }
}

class ReservedBalance {
  String? balance;
  String? platformFee;

  ReservedBalance({this.balance, this.platformFee});

  ReservedBalance.fromJson(Map<String, dynamic> json) {
    balance = json['Balance'];
    platformFee = json['PlatformFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Balance'] = balance;
    data['PlatformFee'] = platformFee;
    return data;
  }
}
