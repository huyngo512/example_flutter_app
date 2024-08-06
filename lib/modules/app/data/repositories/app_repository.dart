import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:modular_app/core/network/dio_expeptions.dart';
import 'package:modular_app/core/network/dio_failure.dart';
import 'package:modular_app/modules/app/data/datasources/remote/app_api.dart';
import 'package:modular_app/modules/app/data/models/example_model.dart';

class AppRepository {
  final AppApi api;

  AppRepository({required this.api});

  Future<Either<DioFailure, Map<String, dynamic>>> getRemoteConfig() async {
    try {
      final response = await api.getRemoteConfig();
      final statusCode = response.statusCode.toString();
      final Map<String, dynamic> mapData = response.data;
      final status = mapData['status'] as int?;
      if (status != 0) {
        return Left(ApiFailure(
            message: mapData['errors']['message'] as String,
            statusCode: statusCode));
      }
      final data = mapData['data'] as List<dynamic>?;
      final configList =
          data?.map((item) => ExampleModel.fromJson(item)).toList();
      return Right({
        'statusCode': statusCode,
        'configList': configList,
      });
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      final statusCode = e.response?.statusCode.toString() ?? '';
      return Left(ApiFailure(message: errorMessage, statusCode: statusCode));
    }
  }
}
