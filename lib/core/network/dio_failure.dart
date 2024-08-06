import 'package:equatable/equatable.dart';

abstract class DioFailure extends Equatable {
  final String message;
  final String statusCode;
  final String code;

  const DioFailure(
      {required this.message, required this.statusCode, this.code = ''});

  @override
  List<Object?> get props => [message, statusCode, code];
}

class ApiFailure extends DioFailure {
  const ApiFailure(
      {required super.message, required super.statusCode, super.code});
}
