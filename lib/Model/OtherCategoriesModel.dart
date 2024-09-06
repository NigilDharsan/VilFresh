class OtherCategoriesModel {
  String? status;
  String? message;
  List<Data>? data;

  OtherCategoriesModel({this.status, this.message, this.data});

  OtherCategoriesModel.fromJson(Map<String, dynamic> json) {
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
  String? day;
  String? date;
  List<OtherItemDetail>? itemDetail;

  Data({this.day, this.date, this.itemDetail});

  Data.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    date = json['Date'];
    if (json['Item_Detail'] != null) {
      itemDetail = <OtherItemDetail>[];
      json['Item_Detail'].forEach((v) {
        itemDetail!.add(new OtherItemDetail.fromJson(v));
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

class OtherItemDetail {
  String? day;
  String? categoryName;
  String? item;
  String? itemID;
  String? uom;
  String? itemImage;
  Null? itemDtl;
  List<DefaultVariant>? defaultVariant;
  List<DefaultVariant>? allVariant;
  List<NextDeliveryDateDay>? nextDeliveryDateDay;
  String? variantCount;
  String? leadTime;
  String? orderClosingTime;
  String? date;

  OtherItemDetail(
      {this.day,
      this.categoryName,
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
      this.date});

  OtherItemDetail.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    categoryName = json['Category_Name'];
    item = json['Item'];
    itemID = json['Item_ID'];
    uom = json['Uom'];
    itemImage = json['Item_Image'];
    itemDtl = json['Item_dtl'];
    if (json['Default_Variant'] != null) {
      defaultVariant = <DefaultVariant>[];
      json['Default_Variant'].forEach((v) {
        defaultVariant!.add(new DefaultVariant.fromJson(v));
      });
    }
    if (json['All_Variant'] != null) {
      allVariant = <DefaultVariant>[];
      json['All_Variant'].forEach((v) {
        allVariant!.add(new DefaultVariant.fromJson(v));
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Category_Name'] = this.categoryName;
    data['Item'] = this.item;
    data['Item_ID'] = this.itemID;
    data['Uom'] = this.uom;
    data['Item_Image'] = this.itemImage;
    data['Item_dtl'] = this.itemDtl;
    if (this.defaultVariant != null) {
      data['Default_Variant'] =
          this.defaultVariant!.map((v) => v.toJson()).toList();
    }
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
