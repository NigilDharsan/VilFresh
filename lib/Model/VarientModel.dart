class VariantModel {
  String? status;
  String? message;
  List<Variants>? variants;

  VariantModel({this.status, this.message, this.variants});

  VariantModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Variants'] != null) {
      variants = <Variants>[];
      json['Variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.variants != null) {
      data['Variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variants {
  String? itemVariantID;
  String? itemVariantName;

  Variants({this.itemVariantID, this.itemVariantName});

  Variants.fromJson(Map<String, dynamic> json) {
    itemVariantID = json['Item_Variant_ID'];
    itemVariantName = json['Item_Variant_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_Variant_ID'] = this.itemVariantID;
    data['Item_Variant_Name'] = this.itemVariantName;
    return data;
  }
}
