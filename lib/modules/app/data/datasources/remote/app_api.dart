import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/core/network/dio_client.dart';

class AppApi {
  Future<Response> getRemoteConfig() async {
    final dioClient = Modular.get<DioClient>();
    const String url = 'api/v1/app/remote-config';
    try {
      final Response response = await dioClient.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
