class AddressModel {
  String? userID;
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
  String? defaultVal;
  String? fullName;

  AddressModel({this.userID, this.addressID, this.emailID, this.city, this.pinCode, this.area, this.residencyType, this.houseFlatNo, this.houseFlatName, this.floorNo, this.block, this.streetColony, this.landMark, this.defaultVal, this.fullName});

AddressModel.fromJson(Map<String, dynamic> json) {
userID = json['User_ID'];
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
defaultVal = json['Default'];
fullName = json['Full_Name'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['User_ID'] = this.userID;
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
data['Default'] = this.defaultVal;
data['Full_Name'] = this.fullName;
return data;
}
}
