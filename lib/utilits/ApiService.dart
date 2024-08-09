import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Model/AddressModel.dart';
import 'package:vilfresh/Model/CartModel.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Model/CityModel.dart';
import 'package:vilfresh/Model/CouponListModel.dart';
import 'package:vilfresh/Model/HomeModel.dart';
import 'package:vilfresh/Model/InsertSurveyModel.dart';
import 'package:vilfresh/Model/OrderHistoryModel.dart';
import 'package:vilfresh/Model/ProductDescriprtionModel.dart';
import 'package:vilfresh/Model/SelectTimeModel.dart';
import 'package:vilfresh/Model/SimilarItemsListModel.dart';
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
        url: ConstantApi.homeScreenUrl + "/$addressID", dio: _dio);
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
    var formData = <String, dynamic>{
      "User_ID": await getuserId(),
    };

    final result = await requestPOST2(
        url: ConstantApi.orderHistoryUrl, formData: formData, dio: _dio);

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
    var formData = <String, dynamic>{
      "Category_ID": categoriesId,
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

  //SUBSCRIPTION QUANTITY
  Future<VariantModel> SubscriptionQntyApi(String categoriesId) async {
    var formData = <String, dynamic>{
      "Category_ID": categoriesId,
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
      "User_ID": await getuserId(),
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
        url: ConstantApi.subscribeurl, formData: formData, dio: _dio);

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
final AddressApiProvider = FutureProvider<AddressModel?>((ref) async {
  return ref.watch(apiServiceProvider).MyaddressApiService();
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

final SubscriptionQntyProvider =
    FutureProvider.autoDispose.family<VariantModel?, String>((ref, id) async {
  return ref.watch(apiServiceProvider).SubscriptionQntyApi(id);
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

//ORDER HISTORY PROVIDER
final OrderHistoryProvider = FutureProvider<OrderHistoryModel?>((ref) async {
  return ref.watch(apiServiceProvider).OrderHistoryApiService();
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
