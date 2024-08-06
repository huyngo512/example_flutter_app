import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/core/helpers/share_preference_helper.dart';

class DioInterceptor extends Interceptor {
  final _sharedPreferenceHelper = Modular.get<SharedPreferenceHelper>();

  DioInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? accessToken = _sharedPreferenceHelper.getUserToken();

    // append access token into request
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    //add os devices to header....
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.reject(err);
  }
}
