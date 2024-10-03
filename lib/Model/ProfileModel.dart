class ProfileModel {
  String? status;
  String? message;
  List<Data>? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? userID;
  String? userName;
  String? mobileNo;
  String? email;
  String? dOB;
  String? gender;
  String? totalMale;
  String? totalFemale;
  String? totalInfants;
  String? totalChildren;
  String? totalSeniorCitizen;
  String? weddingDate;
  String? profileImage;
  String? Address;
  String? State;

  Data(
      {this.userID,
      this.userName,
      this.mobileNo,
      this.email,
      this.dOB,
      this.gender,
      this.totalMale,
      this.totalFemale,
      this.totalInfants,
      this.totalChildren,
      this.totalSeniorCitizen,
      this.weddingDate,
      this.profileImage,
      this.Address,
      this.State});

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['User_ID'];
    userName = json['User_Name'];
    mobileNo = json['Mobile_No'];
    email = json['Email'];
    dOB = json['DOB'];
    gender = json['Gender'];
    totalMale = json['Total_Male'];
    totalFemale = json['Total_Female'];
    totalInfants = json['Total_Infants'];
    totalChildren = json['Total_Children'];
    totalSeniorCitizen = json['Total_Senior_Citizen'];
    weddingDate = json['Wedding_Date'];
    profileImage = json['Profile_Image'];
    Address = json['Address'];
    State = json['State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_ID'] = this.userID;
    data['User_Name'] = this.userName;
    data['Mobile_No'] = this.mobileNo;
    data['Email'] = this.email;
    data['DOB'] = this.dOB;
    data['Gender'] = this.gender;
    data['Total_Male'] = this.totalMale;
    data['Total_Female'] = this.totalFemale;
    data['Total_Infants'] = this.totalInfants;
    data['Total_Children'] = this.totalChildren;
    data['Total_Senior_Citizen'] = this.totalSeniorCitizen;
    data['Wedding_Date'] = this.weddingDate;
    data['Profile_Image'] = this.profileImage;
    data['Address'] = this.Address;
    data['State'] = this.State;

    return data;
  }
}
