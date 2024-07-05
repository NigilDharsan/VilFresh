class ProductDescriptionModel {
  String? status;
  String? message;
  List<ItemVariantData>? itemVariantData;
  List<AboutProdutData>? aboutProdutData;
  List<AboutFarmerData>? aboutFarmerData;

  ProductDescriptionModel(
      {this.status,
        this.message,
        this.itemVariantData,
        this.aboutProdutData,
        this.aboutFarmerData});

  ProductDescriptionModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Item_Variant_Data'] != null) {
      itemVariantData = <ItemVariantData>[];
      json['Item_Variant_Data'].forEach((v) {
        itemVariantData!.add(new ItemVariantData.fromJson(v));
      });
    }
    if (json['About_Produt_Data'] != null) {
      aboutProdutData = <AboutProdutData>[];
      json['About_Produt_Data'].forEach((v) {
        aboutProdutData!.add(new AboutProdutData.fromJson(v));
      });
    }
    if (json['About_Farmer_Data'] != null) {
      aboutFarmerData = <AboutFarmerData>[];
      json['About_Farmer_Data'].forEach((v) {
        aboutFarmerData!.add(new AboutFarmerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.itemVariantData != null) {
      data['Item_Variant_Data'] =
          this.itemVariantData!.map((v) => v.toJson()).toList();
    }
    if (this.aboutProdutData != null) {
      data['About_Produt_Data'] =
          this.aboutProdutData!.map((v) => v.toJson()).toList();
    }
    if (this.aboutFarmerData != null) {
      data['About_Farmer_Data'] =
          this.aboutFarmerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemVariantData {
  String? item;
  String? variant;
  String? variantID;
  String? actualPrice;
  String? discount;
  String? sellingPrice;
  String? itemImage;

  ItemVariantData(
      {this.item,
        this.variant,
        this.variantID,
        this.actualPrice,
        this.discount,
        this.sellingPrice,
        this.itemImage});

  ItemVariantData.fromJson(Map<String, dynamic> json) {
    item = json['Item'];
    variant = json['Variant'];
    variantID = json['Variant_ID'];
    actualPrice = json['Actual_Price'];
    discount = json['Discount'];
    sellingPrice = json['Selling_Price'];
    itemImage = json['Item_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item'] = this.item;
    data['Variant'] = this.variant;
    data['Variant_ID'] = this.variantID;
    data['Actual_Price'] = this.actualPrice;
    data['Discount'] = this.discount;
    data['Selling_Price'] = this.sellingPrice;
    data['Item_Image'] = this.itemImage;
    return data;
  }
}

class AboutProdutData {
  String? itemID;
  String? alsoKnownAs;
  String? seasonality;
  String? basicInformation;

  AboutProdutData(
      {this.itemID, this.alsoKnownAs, this.seasonality, this.basicInformation});

  AboutProdutData.fromJson(Map<String, dynamic> json) {
    itemID = json['Item_ID'];
    alsoKnownAs = json['Also_Known_as'];
    seasonality = json['Seasonality'];
    basicInformation = json['Basic_Information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_ID'] = this.itemID;
    data['Also_Known_as'] = this.alsoKnownAs;
    data['Seasonality'] = this.seasonality;
    data['Basic_Information'] = this.basicInformation;
    return data;
  }
}

class AboutFarmerData {
  String? farmerName;
  String? aboutFarmer;
  String? farmerImage;

  AboutFarmerData({this.farmerName, this.aboutFarmer, this.farmerImage});

  AboutFarmerData.fromJson(Map<String, dynamic> json) {
    farmerName = json['Farmer_Name'];
    aboutFarmer = json['About_Farmer'];
    farmerImage = json['Farmer_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Farmer_Name'] = this.farmerName;
    data['About_Farmer'] = this.aboutFarmer;
    data['Farmer_Image'] = this.farmerImage;
    return data;
  }
}
