class HomeModel {
  List<HomeBanner>? homeBanner;
  List<ShopByCategories>? shopByCategories;
  List<HomeDefaultItems>? homeDefaultItems;
  List<WalletBalance>? walletBalance;

  HomeModel(
      {this.homeBanner,
      this.shopByCategories,
      this.homeDefaultItems,
      this.walletBalance});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['HomeBanner'] != null) {
      homeBanner = <HomeBanner>[];
      json['HomeBanner'].forEach((v) {
        homeBanner!.add(new HomeBanner.fromJson(v));
      });
    }
    if (json['ShopByCategories'] != null) {
      shopByCategories = <ShopByCategories>[];
      json['ShopByCategories'].forEach((v) {
        shopByCategories!.add(new ShopByCategories.fromJson(v));
      });
    }
    if (json['HomeDefaultItems'] != null) {
      homeDefaultItems = <HomeDefaultItems>[];
      json['HomeDefaultItems'].forEach((v) {
        homeDefaultItems!.add(new HomeDefaultItems.fromJson(v));
      });
    }
    if (json['Wallet_Balance'] != null) {
      walletBalance = <WalletBalance>[];
      json['Wallet_Balance'].forEach((v) {
        walletBalance!.add(new WalletBalance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeBanner != null) {
      data['HomeBanner'] = this.homeBanner!.map((v) => v.toJson()).toList();
    }
    if (this.shopByCategories != null) {
      data['ShopByCategories'] =
          this.shopByCategories!.map((v) => v.toJson()).toList();
    }
    if (this.homeDefaultItems != null) {
      data['HomeDefaultItems'] =
          this.homeDefaultItems!.map((v) => v.toJson()).toList();
    }
    if (this.walletBalance != null) {
      data['Wallet_Balance'] =
          this.walletBalance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeBanner {
  String? imageURL;
  String? key;
  String? objectName;
  String? sYSID;
  String? fileName;
  String? remarks;
  String? extension;
  String? contentType;

  HomeBanner(
      {this.imageURL,
      this.key,
      this.objectName,
      this.sYSID,
      this.fileName,
      this.remarks,
      this.extension,
      this.contentType});

  HomeBanner.fromJson(Map<String, dynamic> json) {
    imageURL = json['ImageURL'];
    key = json['Key'];
    objectName = json['Object_Name'];
    sYSID = json['SYSID'];
    fileName = json['File_Name'];
    remarks = json['Remarks'];
    extension = json['Extension'];
    contentType = json['Content_Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageURL'] = this.imageURL;
    data['Key'] = this.key;
    data['Object_Name'] = this.objectName;
    data['SYSID'] = this.sYSID;
    data['File_Name'] = this.fileName;
    data['Remarks'] = this.remarks;
    data['Extension'] = this.extension;
    data['Content_Type'] = this.contentType;
    return data;
  }
}

class ShopByCategories {
  String? catgID;
  String? catgCode;
  String? catgName;
  String? catgImageURL;

  ShopByCategories(
      {this.catgID, this.catgCode, this.catgName, this.catgImageURL});

  ShopByCategories.fromJson(Map<String, dynamic> json) {
    catgID = json['Catg_ID'];
    catgCode = json['Catg_Code'];
    catgName = json['Catg_Name'];
    catgImageURL = json['Catg_ImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Catg_ID'] = this.catgID;
    data['Catg_Code'] = this.catgCode;
    data['Catg_Name'] = this.catgName;
    data['Catg_ImageURL'] = this.catgImageURL;
    return data;
  }
}

class HomeDefaultItems {
  String? categoryName;
  List<DefaultItems>? defaultItems;

  HomeDefaultItems({this.categoryName, this.defaultItems});

  HomeDefaultItems.fromJson(Map<String, dynamic> json) {
    categoryName = json['CategoryName'];
    if (json['defaultItems'] != null) {
      defaultItems = <DefaultItems>[];
      json['defaultItems'].forEach((v) {
        defaultItems!.add(new DefaultItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryName'] = this.categoryName;
    if (this.defaultItems != null) {
      data['defaultItems'] = this.defaultItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DefaultItems {
  String? day;
  String? item;
  String? itemID;
  Null? uom;
  String? variant;
  String? actualPrice;
  String? sellingPrice;
  String? itemImage;

  DefaultItems(
      {this.day,
      this.item,
      this.itemID,
      this.uom,
      this.variant,
      this.actualPrice,
      this.sellingPrice,
      this.itemImage});

  DefaultItems.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    item = json['Item'];
    itemID = json['Item_ID'];
    uom = json['Uom'];
    variant = json['Variant'];
    actualPrice = json['Actual_Price'];
    sellingPrice = json['Selling_Price'];
    itemImage = json['Item_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Day'] = this.day;
    data['Item'] = this.item;
    data['Item_ID'] = this.itemID;
    data['Uom'] = this.uom;
    data['Variant'] = this.variant;
    data['Actual_Price'] = this.actualPrice;
    data['Selling_Price'] = this.sellingPrice;
    data['Item_Image'] = this.itemImage;
    return data;
  }
}

class WalletBalance {
  String? balance;
  String? platformFee;

  WalletBalance({this.balance, this.platformFee});

  WalletBalance.fromJson(Map<String, dynamic> json) {
    balance = json['Balance'];
    platformFee = json['PlatformFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Balance'] = this.balance;
    data['PlatformFee'] = this.platformFee;
    return data;
  }
}
