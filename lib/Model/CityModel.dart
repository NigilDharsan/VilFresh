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
        cities!.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    if (cities != null) {
      data['Cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String? cityID;
  String? cityName;
  String? Image;

  Cities({this.cityID, this.cityName});

  Cities.fromJson(Map<String, dynamic> json) {
    cityID = json['City_ID'];
    cityName = json['City_Name'];
    Image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['City_ID'] = cityID;
    data['City_Name'] = cityName;
    data['Image'] = Image;
    return data;
  }
}
