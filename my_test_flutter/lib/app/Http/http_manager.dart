import 'package:dio/dio.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';

import 'cache.dart';

class HttpManager {
  Dio? _dio;
  factory HttpManager() => _getInstance();
  static HttpManager? _instance;
  static const int TIME_OUT = 30000;
  static HttpManager get instance => _getInstance();
  HttpManager._() {
    BaseOptions options = BaseOptions(
        baseUrl: RequestApi.HOST,
        sendTimeout: TIME_OUT,
        receiveTimeout: TIME_OUT,
        connectTimeout: TIME_OUT);
    _dio = Dio(options);
    //管理cookie

  }
  static HttpManager _getInstance() {
    return _instance ??= HttpManager._();
  }

  Future get(String url,
      {required Map<String, dynamic> params,
        bool refresh = false,
        bool list = false,
        bool cacheDisk = true,
        bool noCache = !CACHE_ENABLED
      }) async {
    Options options = Options(
        extra: {
          "list":list,
          //"noCache":noCache,
          "cacheDisk":cacheDisk,
          "refresh":refresh
        }
    );
    try {
      Response response;
      response = await _dio!.get(url, queryParameters: params,options: options);
      //print("----- + ${response.toString()}");
     /*if (response.data['errorCode'] != 0) {
        throw ResultException(
            response.data['errorCode'], response.data['errorMsg']);
      }*/
      return response.data;
    } on DioError catch (e) {
      //throw HttpDioError.handleError(e);
    }
  }

}