import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:one_signal_flutter/data/api/api_url.dart';
import 'package:one_signal_flutter/data/api/dio_provider.dart';

import '../../session_manager.dart';

class APITDataStore {
  Dio dio = DioProvider.instance();

  APITDataStore();

  // Public Request API
  Future<dynamic> requestAPI(ApiURL apiURL,
      {Map<String, dynamic>? params,
        Map<String, dynamic>? body,
        FormData? formData,
        String path = '',
        bool? isShowError}) async {
    dynamic bodyRequest;
    if (body != null) {
      bodyRequest = jsonEncode(body);
    } else if (formData != null) {
      bodyRequest = formData;
    }
    try {
      late Response response;
      switch (apiURL.methods) {
        case HTTPRequestMethods.get:
          response = await dio.get(
            apiURL.path + path,
            queryParameters: params,
          );
          break;

        case HTTPRequestMethods.post:
          response = await dio.post(
            apiURL.path + path,
            queryParameters: params,
            data: bodyRequest,
          );
          break;

        case HTTPRequestMethods.patch:
          response = await dio.patch(
            apiURL.path + path,
            queryParameters: params,
            data: bodyRequest,
          );
          break;

        case HTTPRequestMethods.delete:
          response = await dio.delete(
            apiURL.path + path,
            queryParameters: params,
            data: bodyRequest,
          );
          break;

        default:
          log('method is not created');
          break;
      }
      return response.data['data'] ?? response.data;
    } on DioError catch (e) {
      log(e.message??'Have an error');
    }
  }
}
