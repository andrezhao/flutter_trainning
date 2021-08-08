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

  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio!.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success---------${response.statusCode}');
      print('get success---------${response.data}');

//      response.data; 响应体
//      response.headers; 响应头
//      response.request; 请求体
//      response.statusCode; 状态码

    } on DioError catch (e) {
      print('get error---------$e');
      return e;
    }
    return response;
  }

  Future post(String url, {dynamic params}) async {
    try {
      Response response;
      if (params == null) {
        response = await _dio!.post(url);
      } else {
        response = await _dio!.post(url, data: params);
      }
      if (response.data['errorCode'] != 0) {
        throw ResultException(
            response.data['errorCode'], response.data['errorMsg']);
      }
      return response.data;
    } on DioError catch (e) {
      throw HttpDioError.handleError(e);
    }
  }

   postFormData(String url, Map<String, dynamic> params) async {
    try {
      Response response;
      response = await _dio!.post(url, data: FormData.fromMap(params));
      if (response.data['errorCode'] != 0) {
        throw ResultException(
            response.data['errorCode'], response.data['errorMsg']);
      }
      return response.data;
    } on DioError catch (e) {
      throw HttpDioError.handleError(e);
    }
  }
}

class HttpDioError {
  static const int LOGIN_CODE = -1001;

  static ResultException handleError(DioError dioError) {
    int code = 9999;
    String message = "未知错误";
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        code = 9000;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        code = 90001;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.sendTimeout:
        code = 90002;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.response:
        code = 90003;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        code = 90004;
        message = "请求已被取消，请重新请求";
        break;
      case DioErrorType.other:
        code = 90005;
        message = "网络异常，请稍后重试！";
        break;
    }
    return ResultException(code, message);
  }
}

class ResultException {
  final int code;
  final String message;

  ResultException(this.code, this.message);
}
/* Future get(String url,
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

      print("----- + ${response.data.toString()}");
     */ /*if (response.data['errorCode'] != 0) {
        throw ResultException(
            response.data['errorCode'], response.data['errorMsg']);
      }*/ /*
      return response.data;
    } on DioError catch (e) {
      //throw HttpDioError.handleError(e);
    }
  }*/
