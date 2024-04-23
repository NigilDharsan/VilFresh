class HomeBannerModel {
  String? status;
  String? message;
  List<Data>? data;

  HomeBannerModel({this.status, this.message, this.data});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
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
  String? imageURL;

  Data({this.imageURL});

  Data.fromJson(Map<String, dynamic> json) {
    imageURL = json['ImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageURL'] = this.imageURL;
    return data;
  }
}
