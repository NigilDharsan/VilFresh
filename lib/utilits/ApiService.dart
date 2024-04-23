import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Model/HomeBannerModel.dart';
import 'package:vilfresh/Model/ShopByCategoryModel.dart';
import 'package:vilfresh/utilits/ConstantsApi.dart';
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

  Future<HomeBannerModel> getHomeBannerApi() async {
    final result = await requestGET(url: ConstantApi.homeBannerdUrl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return HomeBannerModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = HomeBannerModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return HomeBannerModel();
  }

  Future<ShopByCategoryModel> getCategory() async {
    final result =
        await requestGET(url: ConstantApi.shopBYCategorydUrl, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return ShopByCategoryModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = ShopByCategoryModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);
        // Toast.show(result["response"], context);
      }
    }
    return ShopByCategoryModel();
  }
}

final userDataProvider = FutureProvider<HomeBannerModel?>((ref) async {
  return ref.watch(apiServiceProvider).getHomeBannerApi();
});

final shopCategoryDataProvider =
    FutureProvider<ShopByCategoryModel?>((ref) async {
  return ref.watch(apiServiceProvider).getCategory();
});
