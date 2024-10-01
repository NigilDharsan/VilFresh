import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Model/AddressModel.dart';
import 'package:vilfresh/Model/CartModel.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Model/CategoryIssueModel.dart';
import 'package:vilfresh/Model/CityModel.dart';
import 'package:vilfresh/Model/CouponListModel.dart';
import 'package:vilfresh/Model/GetWalletModel.dart';
import 'package:vilfresh/Model/HSCategoryModel.dart';
import 'package:vilfresh/Model/HSListModel.dart';
import 'package:vilfresh/Model/HolidaysModel.dart';
import 'package:vilfresh/Model/HomeModel.dart';
import 'package:vilfresh/Model/InsertSurveyModel.dart';
import 'package:vilfresh/Model/InvoiceItemModel.dart';
import 'package:vilfresh/Model/InvoiceModel.dart';
import 'package:vilfresh/Model/OrderHistoryDetailModel.dart';
import 'package:vilfresh/Model/OrderHistoryModel.dart';
import 'package:vilfresh/Model/OtherCategoriesModel.dart';
import 'package:vilfresh/Model/ProductDescriprtionModel.dart';
import 'package:vilfresh/Model/ProfileModel.dart';
import 'package:vilfresh/Model/SearchModel.dart';
import 'package:vilfresh/Model/SelectTimeModel.dart';
import 'package:vilfresh/Model/SimilarItemsListModel.dart';
import 'package:vilfresh/Model/SubscribeDetailsModel.dart';
import 'package:vilfresh/Model/SubscribedItemModel.dart';
import 'package:vilfresh/Model/SubscribedItemsDetailsModel.dart';
import 'package:vilfresh/Model/SuccessModel.dart';
import 'package:vilfresh/Model/UserRegistrationModel.dart';
import 'package:vilfresh/Model/VarientModel.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/LoginModel.dart';
import 'package:vilfresh/utilits/ConstantsApi.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/MakeApiCall.dart';

import 'Loading_Overlay.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(responseBody: true)); // For debugging
  return dio;
});

// final dioProvider = Provider<Dio>((ref) {
//   return Dio();
// });

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(dioProvider);
  return ApiService(dio);
});

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  T _fromJson<T>(dynamic json) {
    if (json != null) {
      if (T == LoginModel) {
        return LoginModel.fromJson(json) as T;
      } else if (T == SuccessModel) {
        return SuccessModel.fromJson(json) as T;
      }
    } else {
      final jsonResponse = {
        'status': false,
        'message': ConstantApi.SOMETHING_WRONG, //Server not responding
      };
      json = jsonResponse;
    }

    // Add more conditionals for other model classes as needed
    throw Exception("Unknown model type");
  }

  Future<T> _requestGET<T>(String path) async {
    try {
      final response = await _dio.get(path);

      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.

      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here
      throw e;
    }
  }

  Future<T> _requestPOST<T>(
    BuildContext context,
    String path, {
    FormData? data,
  }) async {
    LoadingOverlay.show(context);
    try {
      final response = await _dio.post(path, data: data);

      LoadingOverlay.hide();
      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.

      LoadingOverlay.hide();

      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here

      LoadingOverlay.hide();

      throw e;
    }
  }

  Future<dynamic> get<T>(String path) async {
    return _requestGET<T>(path);
  }

  Future<T> post<T>(BuildContext context, String path, FormData data) async {
    return _requestPOST<T>(context, path, data: data);
  }

  Future<HomeModel> getHomeBannerApi(String addressID) async {
    final result = await requestGET(
        url: ConstantApi.homeScreenUrl +
            "/$addressID" +
            "/${SingleTon().user_id}",
        dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return HomeModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = HomeModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return HomeModel();
  }

  //CITY API SERVICE
  Future<CityModel> GetCityApiService() async {
    final result = await requestGET(url: ConstantApi.getCityUrl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return CityModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = CityModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return CityModel();
  }

  //ORDER HISTORY API SERVICE
  Future<OrderHistoryModel> OrderHistoryApiService() async {
    final result = await requestGET(
        url: ConstantApi.orderListUrl + "/${SingleTon().user_id}", dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return OrderHistoryModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = OrderHistoryModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return OrderHistoryModel();
  }

  Future<OrderHistoryDetailModel> orderHistoryDetailsApiService(
      String headerID) async {
    var formData = <String, dynamic>{
      "User_ID": SingleTon().user_id,
      "Header_ID": headerID
    };

    final result = await requestPOST2(
        url: ConstantApi.orderHistoryUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return OrderHistoryDetailModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = OrderHistoryDetailModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return OrderHistoryDetailModel();
  }

  //ORDER HISTORY API SERVICE
  Future<HolidaysModel> getVacationApiService() async {
    final User_ID = await getuserId();

    final result = await requestGET(
        url: ConstantApi.GetVacationURL + "/$User_ID", dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return HolidaysModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = HolidaysModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return HolidaysModel();
  }

  //INSERT SURVEY API SERVICE
  Future<InsertSurveyModel> AddVacationApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.InsertVacationURL, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return InsertSurveyModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = InsertSurveyModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return InsertSurveyModel();
  }

  //ADD KART API SERVICE
  Future<CartModel> getkartApiService() async {
    var formData = <String, dynamic>{
      "User_ID": await getuserId(),
    };

    final result = await requestPOST2(
        url: ConstantApi.getkartUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return CartModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = CartModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return CartModel();
  }

  //SELECT DATA AND TIME
  Future<SelectTimeModel> DateandtimeApiService() async {
    final result = await requestGET(url: ConstantApi.dataandtimeurl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SelectTimeModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SelectTimeModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SelectTimeModel();
  }

  Future<CategoriesModel> getCategoriesApi(String categoriesId) async {
    final data = await getAddressData();
    final address = data['addressId'] ?? '';

    var formData = <String, dynamic>{
      "Category_ID": categoriesId,
      "User_ID": SingleTon().user_id,
      "City_ID": address
    };

    final result = await requestPOST2(
        url: ConstantApi.DefaultItemUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return CategoriesModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = CategoriesModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return CategoriesModel();
  }

  Future<OtherCategoriesModel> getOtherCategoriesApi(
      String categoriesId) async {
    var formData = <String, dynamic>{
      "Category_ID": categoriesId,
      "User_ID": SingleTon().user_id
    };

    final result = await requestPOST2(
        url: ConstantApi.OtherCatgItemsUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return OtherCategoriesModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = OtherCategoriesModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return OtherCategoriesModel();
  }

  //SUBSCRIPTION QUANTITY
  Future<VariantModel> SubscriptionQntyApi(String categoriesId) async {
    var formData = <String, dynamic>{
      "Category_ID": categoriesId,
      "User_ID": await getuserId()
    };

    final result = await requestPOST2(
        url: ConstantApi.varientUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return VariantModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = VariantModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return VariantModel();
  }

  //INSERT SURVEY API SERVICE
  Future<SubscribeDetailsModel> getSubscribeDetailsApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.subscribeDetailsUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SubscribeDetailsModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SubscribeDetailsModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SubscribeDetailsModel();
  }

  Future<SuccessModel> subscribePauseApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.subscribePause, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

  Future<SuccessModel> subscribeResumeApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.subscribeResume, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

  //SIMILAR ITEM
  Future<SimilarItemListModel> SimilarItemApi(String categories_id) async {
    var formData = <String, dynamic>{
      "Category_ID": categories_id,
    };

    final result = await requestPOST2(
        url: ConstantApi.similarItemListurl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SimilarItemListModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SimilarItemListModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SimilarItemListModel();
  }

  //MY ADDRESS API SERVICE
  Future<AddressModel> MyaddressApiService() async {
    var formData = <String, dynamic>{
      "User_ID": SingleTon().user_id,
    };

    final result = await requestPOST2(
        url: ConstantApi.addressurl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return AddressModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = AddressModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return AddressModel();
  }

//GET PROFILE API SERVICE
  Future<ProfileModel> getProfileApiService() async {
    var formData = <String, dynamic>{
      "User_ID": SingleTon().user_id,
    };

    final result = await requestPOST2(
        url: ConstantApi.getProfileUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return ProfileModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = ProfileModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return ProfileModel();
  }

  //Update Profile

  //Order Place
  Future<SuccessModel> updateprofileApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.updateProfileUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

//Address Delete
  Future<SuccessModel> AddressDeleteApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.deleteAddressurl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

  //PRODUCT DESCRIPTION
  Future<ProductDescriptionModel> productDescriptionApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.productDetailUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return ProductDescriptionModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = ProductDescriptionModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return ProductDescriptionModel();
  }

  //INSERT SURVEY API SERVICE
  Future<InsertSurveyModel> AddSurveyApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.insertSurveyUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return InsertSurveyModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = InsertSurveyModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return InsertSurveyModel();
  }

  //PRODUCT DESCRIPTION
  Future<UserRegistrationModel> UserRegistrationApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.userRegistrationUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return UserRegistrationModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = UserRegistrationModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return UserRegistrationModel();
  }

  //LOGIN MODEL
  Future<T> sendOTP<T>(String path, Map<String, dynamic> data) async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: ConstantApi.SERVER_ONE, // Your base URL
      validateStatus: (status) {
        // Return true if the status code is between 200 and 299 (inclusive)
        // Return false if you want to throw an error for this status code
        return status! >= 200 && status < 300 || status == 404;
      },
    );

    try {
      Response response = await dio.post(path, data: data);
      // Handle successful response

      print(response.data);
      final ert = _fromJson<T>(response.data);
      return ert;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 404) {
        // Handle 404 error

        print('Resource not found');
        return _fromJson<T>(e.response!.data);
      } else {
        // Handle other Dio errors
        print('Error: ${e.message}');
        throw e;
      }
    }
  }

  Future<T> login<T>(String path, Map<String, dynamic> data) async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: ConstantApi.SERVER_ONE, // Your base URL
      validateStatus: (status) {
        // Return true if the status code is between 200 and 299 (inclusive)
        // Return false if you want to throw an error for this status code
        return status! >= 200 && status < 300 || status == 404;
      },
    );

    try {
      Response response = await dio.post(path, data: data);
      // Handle successful response

      print(response.data);
      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 404) {
        // Handle 404 error

        print('Resource not found');
        return _fromJson<T>(e.response!.data);
      } else {
        // Handle other Dio errors
        print('Error: ${e.message}');
        throw e;
      }
    }
  }

  //PRODUCT AddToCard
  Future<UserRegistrationModel> AddToCardApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.addToCardUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return UserRegistrationModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = UserRegistrationModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return UserRegistrationModel();
  }

  //PRODUCT AddToCardUpdate
  Future<UserRegistrationModel> AddToCardUpdateApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.addToCardUpdateUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return UserRegistrationModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = UserRegistrationModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return UserRegistrationModel();
  }

  //PRODUCT AddToCardDelete
  Future<UserRegistrationModel> AddToCardDeleteApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.addToCardDeleteUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return UserRegistrationModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = UserRegistrationModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return UserRegistrationModel();
  }

  //Order Place
  Future<SuccessModel> OrderPlaceApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.orderPlaceUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

  //COUPON
  Future<CouponModel> CouponlistApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.couponurl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return CouponModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = CouponModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return CouponModel();
  }

  //COUPON
  Future<CouponModel> OptSendApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.OTPSendUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return CouponModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = CouponModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return CouponModel();
  }

  //COUPON
  Future<CouponModel> VerifyOTPApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.VerifyOTPtUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return CouponModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = CouponModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return CouponModel();
  }

  //SUBSCRIBE
  Future<SuccessModel> SubscribeApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.SubscribeUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

  Future<SuccessModel> SubscribeUpdateApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.updateSubscribeUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

  //SUBSCRIBED ITEMS
  Future<SubscribedItemModel> SubscribeditemApiService() async {
    final User_ID = await getuserId();

    final result = await requestGET(
        url: ConstantApi.subscribeditemurl + "/$User_ID", dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SubscribedItemModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SubscribedItemModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SubscribedItemModel();
  }

  //SUBSCRIBED ITEM DETAILS
  Future<SubscribedItemDetailsModel> SubscribeditemdetailsApiService(
      {required List<String> itemId}) async {
    print("API SERVICE ITEMID ${itemId}");
    final result = await requestGET(
        url:
            "${ConstantApi.subscribeditemdetailsurl}/${SingleTon().user_id}/${itemId[0]}/${itemId[1]}",
        dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");

      final obj = SubscribedItemDetailsModel?.fromJson(result["response"]);
      return obj;
    } else {
      try {
        var resultval = SubscribedItemDetailsModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SubscribedItemDetailsModel();
  }

  //REMOVE SUBSCRIBED ITEMS
  Future<SuccessModel> removesubscribeditemApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.removesubscribeditemdetailsurl,
        formData: formData,
        dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

  // GET WALLET

  //SUBSCRIBED ITEMS
  Future<GetWalletModel> GetWalletApiService() async {
    final User_ID = await getuserId();

    final result =
        await requestGET(url: ConstantApi.getBalance + "/$User_ID", dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return GetWalletModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = GetWalletModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return GetWalletModel();
  }

  //CANCEL HOLIDAY ITEMS
  Future<SuccessModel> cancelHolidayitemApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.CancelVacationurl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }

  //SEARCH ITEMS

  Future<SearchModel> searchItemApiService({required String searchText}) async {
    final data = await getAddressData();
    final address = data['addressId'] ?? '';

    final result = await requestGET(
        url: ConstantApi.searchItemUrl + "/${address}" + "/${searchText}",
        dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SearchModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SearchModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SearchModel();
  }

  // HELP AND SUPPORT

  Future<HSCategoryModel> GetHSCategoryApiService() async {
    final result = await requestGET(url: ConstantApi.getHSCatgeory, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return HSCategoryModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = HSCategoryModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return HSCategoryModel();
  }

  Future<CategoryIssueModel> GetIssuesApiService(String category_id) async {
    final result = await requestGET(
        url: ConstantApi.getIssuesItemUrl + "/$category_id", dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return CategoryIssueModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = CategoryIssueModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return CategoryIssueModel();
  }

  Future<InvoiceModel> GetInvoiceApiService() async {
    final User_ID = await getuserId();

    final result = await requestGET(
        url: ConstantApi.getInvoiceID + "/$User_ID", dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return InvoiceModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = InvoiceModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return InvoiceModel();
  }

  Future<InvoiceItemModel> getInvoiceItemApiService(String headID) async {
    final User_ID = await getuserId();

    final result = await requestGET(
        url: ConstantApi.getInvoiceItemUrl + "/$User_ID" + "/$headID",
        dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return InvoiceItemModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = InvoiceItemModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return InvoiceItemModel();
  }

  Future<HSListModel> getHSListApiService() async {
    final User_ID = await getuserId();

    final result = await requestGET(
        url: ConstantApi.getHSListUrl + "/$User_ID", dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return HSListModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = HSListModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return HSListModel();
  }

  Future<SuccessModel> SubmitHelpSupportApiService(
      {required Map<String, dynamic> formData}) async {
    final result = await requestPOST2(
        url: ConstantApi.helpSupportSubmitUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return SuccessModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = SuccessModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return SuccessModel();
  }
}

final userDataProvider =
    FutureProvider.family<HomeModel?, String>((ref, addressID) async {
  return ref.watch(apiServiceProvider).getHomeBannerApi(addressID);
});

final getCityApiProvider = FutureProvider<CityModel?>((ref) async {
  return ref.watch(apiServiceProvider).GetCityApiService();
});

//MY ADDRESS
final AddressApiProvider =
    FutureProvider.autoDispose<AddressModel?>((ref) async {
  return ref.watch(apiServiceProvider).MyaddressApiService();
});

final getProfileApiProvider =
    FutureProvider.autoDispose<ProfileModel?>((ref) async {
  return ref.watch(apiServiceProvider).getProfileApiService();
});

// AddTOCARDDELETE

final addressDeleteProvider = FutureProvider.autoDispose
    .family<SuccessModel?, Map<String, dynamic>>((ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .AddressDeleteApiService(formData: formdata);
});
//SELECT TIME AND DATE
final TimeanddateApiProvider = FutureProvider<SelectTimeModel?>((ref) async {
  return ref.watch(apiServiceProvider).DateandtimeApiService();
});

//COUPON
final couponProvider = FutureProvider.autoDispose
    .family<CouponModel?, Map<String, dynamic>>((ref, formdata) async {
  return ref.watch(apiServiceProvider).CouponlistApiService(formData: formdata);
});

//DAILY SUBSCRIPTION DETAILS
final CategoriesProvider = FutureProvider.autoDispose
    .family<CategoriesModel?, String>((ref, id) async {
  return ref.watch(apiServiceProvider).getCategoriesApi(id);
});

final OtherCategoriesProvider = FutureProvider.autoDispose
    .family<OtherCategoriesModel?, String>((ref, id) async {
  return ref.watch(apiServiceProvider).getOtherCategoriesApi(id);
});

final SubscriptionQntyProvider =
    FutureProvider.autoDispose.family<VariantModel?, String>((ref, id) async {
  return ref.watch(apiServiceProvider).SubscriptionQntyApi(id);
});

final subscribeDetailProvider = FutureProvider.autoDispose
    .family<SubscribeDetailsModel?, Map<String, dynamic>>(
        (ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .getSubscribeDetailsApiService(formData: formdata);
});

final SimilarItemProvider = FutureProvider.autoDispose
    .family<SimilarItemListModel?, String>((ref, id) async {
  return ref.watch(apiServiceProvider).SimilarItemApi(id);
});

final ProductDetailProvider = FutureProvider.autoDispose
    .family<ProductDescriptionModel?, Map<String, dynamic>>(
        (ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .productDescriptionApiService(formData: formdata);
});

//ADD SURVEY PROVIDER
final AddSurveyProvider = FutureProvider.autoDispose
    .family<InsertSurveyModel?, Map<String, dynamic>>((ref, formdata) async {
  return ref.watch(apiServiceProvider).AddSurveyApiService(formData: formdata);
});

//HOLIDAY LIST PROVIDER
final HolidayListProvider =
    FutureProvider.autoDispose<HolidaysModel?>((ref) async {
  return ref.watch(apiServiceProvider).getVacationApiService();
});

//ORDER HISTORY PROVIDER
final OrderHistoryProvider =
    FutureProvider.autoDispose<OrderHistoryModel?>((ref) async {
  return ref.watch(apiServiceProvider).OrderHistoryApiService();
});

final orderHistoryDetailsProvider = FutureProvider.autoDispose
    .family<OrderHistoryDetailModel?, String>((ref, headerID) async {
  return ref.watch(apiServiceProvider).orderHistoryDetailsApiService(headerID);
});

//GET CART PROVIDER
final GetCartProvider = FutureProvider.autoDispose<CartModel?>((ref) async {
  return ref.watch(apiServiceProvider).getkartApiService();
});

//USER REGISTRATION MODEL
final UserRegistrationProvider = FutureProvider.autoDispose
    .family<UserRegistrationModel?, Map<String, dynamic>>(
        (ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .UserRegistrationApiService(formData: formdata);
});

// AddTOCARD

final AddToCardProvider = FutureProvider.autoDispose
    .family<UserRegistrationModel?, Map<String, dynamic>>(
        (ref, formdata) async {
  return ref.watch(apiServiceProvider).AddToCardApiService(formData: formdata);
});

// AddTOCARDUPDATE

final AddToCardUpdateProvider = FutureProvider.autoDispose
    .family<UserRegistrationModel?, Map<String, dynamic>>(
        (ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .AddToCardUpdateApiService(formData: formdata);
});

// AddTOCARDDELETE

final AddToCardDeleteProvider = FutureProvider.autoDispose
    .family<UserRegistrationModel?, Map<String, dynamic>>(
        (ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .AddToCardDeleteApiService(formData: formdata);
});

//SUBSCRIBE
final subscribeProvider = FutureProvider.autoDispose
    .family<SuccessModel?, Map<String, dynamic>>((ref, formdata) async {
  return ref.watch(apiServiceProvider).SubscribeApiService(formData: formdata);
});

//SUBSCRIBED ITEM
final SubscribeditemProvider =
    FutureProvider<SubscribedItemModel?>((ref) async {
  return ref.watch(apiServiceProvider).SubscribeditemApiService();
});

//SUBSCRIBED ITEM DETAILS
final SubscribeditemdetailsProvider =
    FutureProvider.family<SubscribedItemDetailsModel?, List<String>>(
        (ref, itemId) async {
  return ref
      .watch(apiServiceProvider)
      .SubscribeditemdetailsApiService(itemId: itemId);
});

//REMOVE SUBSCRIBED ITEMS
final RemovesubscribeditemProvider = FutureProvider.autoDispose
    .family<SuccessModel?, Map<String, dynamic>>((ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .removesubscribeditemApiService(formData: formdata);
});

final subscribedPauseitemProvider = FutureProvider.autoDispose
    .family<SuccessModel?, Map<String, dynamic>>((ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .subscribePauseApiService(formData: formdata);
});

final subscribedResumeitemProvider = FutureProvider.autoDispose
    .family<SuccessModel?, Map<String, dynamic>>((ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .subscribeResumeApiService(formData: formdata);
});

//GET WALLET
final getWalletProvider = FutureProvider<GetWalletModel?>((ref) async {
  return ref.watch(apiServiceProvider).GetWalletApiService();
});

//REMOVE SUBSCRIBED ITEMS
final CancelHolidayitemProvider = FutureProvider.autoDispose
    .family<SuccessModel?, Map<String, dynamic>>((ref, formdata) async {
  return ref
      .watch(apiServiceProvider)
      .cancelHolidayitemApiService(formData: formdata);
});

//SEARCH ITEMS

final SearchItemsListProvider = FutureProvider.autoDispose
    .family<SearchModel?, String>((ref, searchText) async {
  return ref
      .watch(apiServiceProvider)
      .searchItemApiService(searchText: searchText);
});

// HELP AND SUPPORT

final GetHSCategoryProvider = FutureProvider<HSCategoryModel?>((ref) async {
  return ref.watch(apiServiceProvider).GetHSCategoryApiService();
});

final GetIssuesProvider =
    FutureProvider.family<CategoryIssueModel?, String>((ref, categoryID) async {
  return ref.watch(apiServiceProvider).GetIssuesApiService(categoryID);
});

final GetInvoiceProvider = FutureProvider<InvoiceModel?>((ref) async {
  return ref.watch(apiServiceProvider).GetInvoiceApiService();
});

final getInvoiceItemProvider =
    FutureProvider.family<InvoiceItemModel?, String>((ref, headID) async {
  return ref.watch(apiServiceProvider).getInvoiceItemApiService(headID);
});

final getHSListProvider = FutureProvider<HSListModel?>((ref) async {
  return ref.watch(apiServiceProvider).getHSListApiService();
});
