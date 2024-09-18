class ProductDescriptionModel {
  String? status;
  String? message;
  List<ItemVariantData>? itemVariantData;
  List<AboutProdutData>? aboutProdutData;
  List<AboutFarmerData>? aboutFarmerData;
  List<SimilarItems>? similarItems;

  ProductDescriptionModel(
      {this.status,
      this.message,
      this.itemVariantData,
      this.aboutProdutData,
      this.aboutFarmerData,
      this.similarItems});

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
    if (json['SimilarItems'] != null) {
      similarItems = <SimilarItems>[];
      json['SimilarItems'].forEach((v) {
        similarItems!.add(new SimilarItems.fromJson(v));
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
    if (this.similarItems != null) {
      data['SimilarItems'] = this.similarItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemVariantData {
  String? day;
  String? date;
  List<ItemDetail>? itemDetail;

  ItemVariantData({this.day, this.date, this.itemDetail});

  ItemVariantData.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    date = json['Date'];
    if (json['Item_Detail'] != null) {
      itemDetail = <ItemDetail>[];
      json['Item_Detail'].forEach((v) {
        itemDetail!.add(new ItemDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Date'] = this.date;
    if (this.itemDetail != null) {
      data['Item_Detail'] = this.itemDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemDetail {
  Null? day;
  String? categoryName;
  String? Category_ID;
  String? item;
  String? itemID;
  String? uom;
  String? itemImage;
  Null? itemDtl;
  Null? defaultVariant;
  List<AllVariant>? allVariant;
  List<NextDeliveryDateDay>? nextDeliveryDateDay;
  String? variantCount;
  String? leadTime;
  String? orderClosingTime;
  Null? date;
  Null? categoryType;

  ItemDetail(
      {this.day,
      this.categoryName,
      this.Category_ID,
      this.item,
      this.itemID,
      this.uom,
      this.itemImage,
      this.itemDtl,
      this.defaultVariant,
      this.allVariant,
      this.nextDeliveryDateDay,
      this.variantCount,
      this.leadTime,
      this.orderClosingTime,
      this.date,
      this.categoryType});

  ItemDetail.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    categoryName = json['Category_Name'];
    Category_ID = json['Category_ID'];
    item = json['Item'];
    itemID = json['Item_ID'];
    uom = json['Uom'];
    itemImage = json['Item_Image'];
    itemDtl = json['Item_dtl'];
    defaultVariant = json['Default_Variant'];
    if (json['All_Variant'] != null) {
      allVariant = <AllVariant>[];
      json['All_Variant'].forEach((v) {
        allVariant!.add(new AllVariant.fromJson(v));
      });
    }
    if (json['Next_Delivery_Date_Day'] != null) {
      nextDeliveryDateDay = <NextDeliveryDateDay>[];
      json['Next_Delivery_Date_Day'].forEach((v) {
        nextDeliveryDateDay!.add(new NextDeliveryDateDay.fromJson(v));
      });
    }
    variantCount = json['Variant_Count'];
    leadTime = json['Lead_Time'];
    orderClosingTime = json['Order_Closing_Time'];
    date = json['Date'];
    categoryType = json['Category_Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Category_Name'] = this.categoryName;
    data['Category_ID'] = this.Category_ID;
    data['Item'] = this.item;
    data['Item_ID'] = this.itemID;
    data['Uom'] = this.uom;
    data['Item_Image'] = this.itemImage;
    data['Item_dtl'] = this.itemDtl;
    data['Default_Variant'] = this.defaultVariant;
    if (this.allVariant != null) {
      data['All_Variant'] = this.allVariant!.map((v) => v.toJson()).toList();
    }
    if (this.nextDeliveryDateDay != null) {
      data['Next_Delivery_Date_Day'] =
          this.nextDeliveryDateDay!.map((v) => v.toJson()).toList();
    }
    data['Variant_Count'] = this.variantCount;
    data['Lead_Time'] = this.leadTime;
    data['Order_Closing_Time'] = this.orderClosingTime;
    data['Date'] = this.date;
    data['Category_Type'] = this.categoryType;
    return data;
  }
}

class AllVariant {
  String? itemQty;
  String? variantID;
  String? actualPrice;
  String? variantName;
  String? sellingPrice;

  AllVariant(
      {this.itemQty,
      this.variantID,
      this.actualPrice,
      this.variantName,
      this.sellingPrice});

  AllVariant.fromJson(Map<String, dynamic> json) {
    itemQty = json['Item_Qty'];
    variantID = json['Variant_ID'];
    actualPrice = json['Actual_price'];
    variantName = json['Variant_Name'];
    sellingPrice = json['Selling_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_Qty'] = this.itemQty;
    data['Variant_ID'] = this.variantID;
    data['Actual_price'] = this.actualPrice;
    data['Variant_Name'] = this.variantName;
    data['Selling_price'] = this.sellingPrice;
    return data;
  }
}

class NextDeliveryDateDay {
  String? dates;
  String? dayName;

  NextDeliveryDateDay({this.dates, this.dayName});

  NextDeliveryDateDay.fromJson(Map<String, dynamic> json) {
    dates = json['dates'];
    dayName = json['day_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dates'] = this.dates;
    data['day_name'] = this.dayName;
    return data;
  }
}

class SimilarItems {
  String? day;
  String? date;
  List<SimilarItemDetail>? itemDetail;

  SimilarItems({this.day, this.date, this.itemDetail});

  SimilarItems.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    date = json['Date'];
    if (json['Item_Detail'] != null) {
      itemDetail = <SimilarItemDetail>[];
      json['Item_Detail'].forEach((v) {
        itemDetail!.add(new SimilarItemDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Date'] = this.date;
    if (this.itemDetail != null) {
      data['Item_Detail'] = this.itemDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SimilarItemDetail {
  Null? day;
  String? categoryName;
  String? item;
  String? itemID;
  String? uom;
  String? itemImage;
  String? subscriptionStatus;
  Null? itemDtl;
  List<DefaultVariant>? defaultVariant;
  List<AllVariant>? allVariant;
  String? nextDeliveryDateDay;
  String? variantCount;
  String? leadTime;
  String? orderClosingTime;
  Null? date;
  String? categoryType;
  String? categoryID;

  SimilarItemDetail(
      {this.day,
      this.categoryName,
      this.item,
      this.itemID,
      this.uom,
      this.itemImage,
      this.subscriptionStatus,
      this.itemDtl,
      this.defaultVariant,
      this.allVariant,
      this.nextDeliveryDateDay,
      this.variantCount,
      this.leadTime,
      this.orderClosingTime,
      this.date,
      this.categoryType,
      this.categoryID});

  SimilarItemDetail.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    categoryName = json['Category_Name'];
    item = json['Item'];
    itemID = json['Item_ID'];
    uom = json['Uom'];
    itemImage = json['Item_Image'];
    subscriptionStatus = json['Subscription_Status'];
    itemDtl = json['Item_dtl'];
    if (json['Default_Variant'] != null) {
      defaultVariant = <DefaultVariant>[];
      json['Default_Variant'].forEach((v) {
        defaultVariant!.add(new DefaultVariant.fromJson(v));
      });
    }
    if (json['All_Variant'] != null) {
      allVariant = <AllVariant>[];
      json['All_Variant'].forEach((v) {
        allVariant!.add(new AllVariant.fromJson(v));
      });
    }
    nextDeliveryDateDay = json['Next_Delivery_Date_Day'];
    variantCount = json['Variant_Count'];
    leadTime = json['Lead_Time'];
    orderClosingTime = json['Order_Closing_Time'];
    date = json['Date'];
    categoryType = json['Category_Type'];
    categoryID = json['Category_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Category_Name'] = this.categoryName;
    data['Item'] = this.item;
    data['Item_ID'] = this.itemID;
    data['Uom'] = this.uom;
    data['Item_Image'] = this.itemImage;
    data['Subscription_Status'] = this.subscriptionStatus;
    data['Item_dtl'] = this.itemDtl;
    if (this.defaultVariant != null) {
      data['Default_Variant'] =
          this.defaultVariant!.map((v) => v.toJson()).toList();
    }
    if (this.allVariant != null) {
      data['All_Variant'] = this.allVariant!.map((v) => v.toJson()).toList();
    }
    data['Next_Delivery_Date_Day'] = this.nextDeliveryDateDay;
    data['Variant_Count'] = this.variantCount;
    data['Lead_Time'] = this.leadTime;
    data['Order_Closing_Time'] = this.orderClosingTime;
    data['Date'] = this.date;
    data['Category_Type'] = this.categoryType;
    data['Category_ID'] = this.categoryID;
    return data;
  }
}

class DefaultVariant {
  String? itemQty;
  String? variantID;
  String? actualPrice;
  String? variantName;
  String? sellingPrice;
  Null? discount;

  DefaultVariant(
      {this.itemQty,
      this.variantID,
      this.actualPrice,
      this.variantName,
      this.sellingPrice,
      this.discount});

  DefaultVariant.fromJson(Map<String, dynamic> json) {
    itemQty = json['Item_Qty'];
    variantID = json['Variant_ID'];
    actualPrice = json['Actual_price'];
    variantName = json['Variant_Name'];
    sellingPrice = json['Selling_price'];
    discount = json['Discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Item_Qty'] = this.itemQty;
    data['Variant_ID'] = this.variantID;
    data['Actual_price'] = this.actualPrice;
    data['Variant_Name'] = this.variantName;
    data['Selling_price'] = this.sellingPrice;
    data['Discount'] = this.discount;
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
