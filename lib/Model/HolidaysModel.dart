class HolidaysModel {
  String? status;
  String? message;
  List<Data>? data;

  HolidaysModel({this.status, this.message, this.data});

  HolidaysModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
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
    data['Message'] = message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? fromDate;
  String? fromDay;
  String? toDate;
  String? toDay;
  String? userID;
  String? vacationID;

  Data(
      {this.fromDate,
      this.fromDay,
      this.toDate,
      this.toDay,
      this.userID,
      this.vacationID});

  Data.fromJson(Map<String, dynamic> json) {
    fromDate = json['From_Date'];
    fromDay = json['From_Day'];
    toDate = json['To_Date'];
    toDay = json['To_Day'];
    userID = json['User_ID'];
    vacationID = json['Vacation_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['From_Date'] = fromDate;
    data['From_Day'] = fromDay;
    data['To_Date'] = toDate;
    data['To_Day'] = toDay;
    data['User_ID'] = userID;
    data['Vacation_ID'] = vacationID;
    return data;
  }
}
