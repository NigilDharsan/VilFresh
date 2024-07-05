class CityModel {
  String? status;
  String? message;
  List<Cities>? cities;

  CityModel({this.status, this.message, this.cities});

  CityModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Cities'] != null) {
      cities = <Cities>[];
      json['Cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.cities != null) {
      data['Cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String? cityID;
  String? cityName;

  Cities({this.cityID, this.cityName});

  Cities.fromJson(Map<String, dynamic> json) {
    cityID = json['City_ID'];
    cityName = json['City_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['City_ID'] = this.cityID;
    data['City_Name'] = this.cityName;
    return data;
  }
}
