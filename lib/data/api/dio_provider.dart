
import 'package:dio/dio.dart';
import 'package:one_signal_flutter/data/api/config_enviroment.dart';

class DioProvider{
  static Dio instance(){
    final dio = Dio()
        ..options.baseUrl = ConfigEnvironment.zingMp3Url
        ..options.connectTimeout = const Duration(milliseconds: 300000)
        ..options.receiveTimeout = const Duration(milliseconds: 300000)
        ..interceptors.add(HttpLogInterceptor());
    return dio;
  }
}

class HttpLogInterceptor extends InterceptorsWrapper{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);

  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}