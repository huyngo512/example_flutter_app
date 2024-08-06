import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modular_app/modules/app/data/models/example_model.dart';
import 'package:modular_app/modules/app/data/repositories/app_repository.dart';
import 'package:modular_app/modules/app/presentation/blocs/app_config/app_config_event.dart';
import 'package:modular_app/modules/app/presentation/blocs/app_config/app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  final AppRepository repository;

  AppConfigBloc({required this.repository}) : super(AppConfigInitial()) {
    on<AppConfigEvent>((event, emit) async {
      if (event is AppGetConfigListRequested) {
        emit(const AppStateConfigList.pending());

        final result = await repository.getRemoteConfig();

        result.fold(
            (l) => emit(AppStateConfigList.rejected(
                statusCode: l.statusCode, error: l.message)), (r) {
          final List<ExampleModel>? configList = r['configList'];
          emit(AppStateConfigList.fulfilled(configList: configList));
        });
      }
    });
  }
}
