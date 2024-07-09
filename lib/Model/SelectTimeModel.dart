class SelectTimeModel {
  String? status;
  String? message;
  List<Data>? data;

  SelectTimeModel({this.status, this.message, this.data});

  SelectTimeModel.fromJson(Map<String, dynamic> json) {
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
  String? slotID;
  String? description;
  String? time;

  Data({this.slotID, this.description, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    slotID = json['Slot_ID'];
    description = json['Description'];
    time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Slot_ID'] = this.slotID;
    data['Description'] = this.description;
    data['Time'] = this.time;
    return data;
  }
}
