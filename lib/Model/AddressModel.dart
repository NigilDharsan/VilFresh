class AddressModel {
  String? status;
  String? message;
  List<AddressData>? data;

  AddressModel({this.status, this.message, this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <AddressData>[];
      json['Data'].forEach((v) {
        data!.add(new AddressData.fromJson(v));
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

class AddressData {
  String? userID;
  String? fullName;
  String? addressID;
  String? emailID;
  String? city;
  String? pinCode;
  String? area;
  String? residencyType;
  String? houseFlatNo;
  String? houseFlatName;
  String? floorNo;
  String? block;
  String? streetColony;
  String? landMark;
  String? defaults;
  bool? ischeck = false;
  String? addressNewButton;
  String? validateAddress;

  AddressData(
      {this.userID,
      this.fullName,
      this.addressID,
      this.emailID,
      this.city,
      this.pinCode,
      this.area,
      this.residencyType,
      this.houseFlatNo,
      this.houseFlatName,
      this.floorNo,
      this.block,
      this.streetColony,
      this.landMark,
      this.defaults,
      this.ischeck,
      this.addressNewButton,
      this.validateAddress});

  AddressData.fromJson(Map<String, dynamic> json) {
    userID = json['User_ID'];
    fullName = json['Full_Name'];
    addressID = json['Address_ID'];
    emailID = json['Email_ID'];
    city = json['City'];
    pinCode = json['PinCode'];
    area = json['Area'];
    residencyType = json['Residency_Type'];
    houseFlatNo = json['House_Flat_No'];
    houseFlatName = json['House_Flat_Name'];
    floorNo = json['Floor_No'];
    block = json['Block'];
    streetColony = json['Street_Colony'];
    landMark = json['LandMark'];
    defaults = json['Default'];
    addressNewButton = json['Address_New_Button'];
    validateAddress = json['Validate_Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_ID'] = this.userID;
    data['Full_Name'] = this.fullName;
    data['Address_ID'] = this.addressID;
    data['Email_ID'] = this.emailID;
    data['City'] = this.city;
    data['PinCode'] = this.pinCode;
    data['Area'] = this.area;
    data['Residency_Type'] = this.residencyType;
    data['House_Flat_No'] = this.houseFlatNo;
    data['House_Flat_Name'] = this.houseFlatName;
    data['Floor_No'] = this.floorNo;
    data['Block'] = this.block;
    data['Street_Colony'] = this.streetColony;
    data['LandMark'] = this.landMark;
    data['Default'] = this.defaults;
    data['Address_New_Button'] = this.addressNewButton;
    data['Validate_Address'] = this.validateAddress;

    return data;
  }
}
