class SurveyModel {
  String? status;
  String? message;
  List<SurveyData>? data;

  SurveyModel({this.status, this.message, this.data});

  SurveyModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <SurveyData>[];
      json['Data'].forEach((v) {
        data!.add(new SurveyData.fromJson(v));
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

class SurveyData {
  String? question;
  String? iD;
  String? answer;
  String? type;
  List<SPDATE>? sPDATE;

  SurveyData({this.question, this.iD, this.answer, this.type, this.sPDATE});

  SurveyData.fromJson(Map<String, dynamic> json) {
    question = json['Question'];
    iD = json['ID'];
    answer = json['Answer'];
    type = json['Type'];
    if (json['SP_DATE'] != null) {
      sPDATE = <SPDATE>[];
      json['SP_DATE'].forEach((v) {
        sPDATE!.add(new SPDATE.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Question'] = this.question;
    data['ID'] = this.iD;
    data['Answer'] = this.answer;
    data['Type'] = this.type;
    if (this.sPDATE != null) {
      data['SP_DATE'] = this.sPDATE!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SPDATE {
  String? name;
  String? date;

  SPDATE({this.name, this.date});

  SPDATE.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Date'] = this.date;
    return data;
  }
}
