class StateModel {
  String? status;
  String? message;
  List<StateData>? data;

  StateModel({this.status, this.message, this.data});

  StateModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <StateData>[];
      json['Data'].forEach((v) {
        data!.add(new StateData.fromJson(v));
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

class StateData {
  String? stateID;
  String? stateName;

  StateData({this.stateID, this.stateName});

  StateData.fromJson(Map<String, dynamic> json) {
    stateID = json['State_ID'];
    stateName = json['State_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['State_ID'] = this.stateID;
    data['State_Name'] = this.stateName;
    return data;
  }
}
