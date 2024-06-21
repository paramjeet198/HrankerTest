import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hrankertask/core/api_constants.dart';
import 'package:hrankertask/model/rate_api_response.dart';
import 'package:hrankertask/util/logger.dart';

import '../model/asset_api_response.dart';

class ApiService {
  final dio = Dio();

  Future<AssetResponse> getAssets() async {
    try {
      var apiResponse =
          await dio.get(ApiConstants.baseUrl + ApiConstants.assetEndPoint);
      if (apiResponse.statusCode == 200) {
        var result = jsonDecode(apiResponse.toString()) as Map<String, dynamic>;
        return AssetResponse.fromJson(result);
      } else {
        throw Exception('An unknown error occurred');
      }
    } on DioException catch (e) {
      Log.v('getAssets: $e');
      rethrow;
    }
  }

  Future<RateResponse> getRates() async {
    try {
      var apiResponse =
          await dio.get(ApiConstants.baseUrl + ApiConstants.rateEndPoint);
      if (apiResponse.statusCode == 200) {
        var result = jsonDecode(apiResponse.toString()) as Map<String, dynamic>;
        return RateResponse.fromJson(result);
      } else {
        throw Exception('An unknown error occurred');
      }
    } on DioException catch (e) {
      Log.v('getRates: $e');
      rethrow;
    }
  }
}
