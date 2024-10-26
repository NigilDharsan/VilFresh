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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Slot_ID'] = slotID;
    data['Description'] = description;
    data['Time'] = time;
    return data;
  }
}
