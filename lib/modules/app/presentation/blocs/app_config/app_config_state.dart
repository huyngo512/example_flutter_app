import 'package:equatable/equatable.dart';
import 'package:modular_app/modules/app/data/models/example_model.dart';

sealed class AppConfigState extends Equatable {
  const AppConfigState();

  @override
  List<Object?> get props => [];
}

final class AppConfigInitial extends AppConfigState {}

final class AppStateConfigList extends AppConfigState {
  final bool isRequesting;
  final String error;
  final String statusCode;
  final List<ExampleModel>? configList;

  const AppStateConfigList._(
      {this.isRequesting = false,
      this.error = '',
      this.statusCode = '',
      this.configList});

  const AppStateConfigList.initial() : this._();
  const AppStateConfigList.pending() : this._(isRequesting: true);
  const AppStateConfigList.rejected(
      {required String statusCode, required String error})
      : this._(statusCode: statusCode, error: error);
  const AppStateConfigList.fulfilled({List<ExampleModel>? configList})
      : this._(statusCode: '200', isRequesting: false, configList: configList);

  @override
  List<Object?> get props => [
        isRequesting,
        error,
        statusCode,
        configList,
      ];
}
