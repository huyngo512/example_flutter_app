import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/core/constants/app_environment.dart';
import 'package:modular_app/core/constants/module_routes.dart';
import 'package:modular_app/core/helpers/share_preference_helper.dart';
import 'package:modular_app/core/network/dio_client.dart';
import 'package:modular_app/modules/app/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainModule extends Module {
  final SharedPreferences preHelper;

  MainModule({required this.preHelper});

  @override
  void binds(Injector i) {
    // shared preference
    i.addSingleton(() => SharedPreferenceHelper(preHelper: preHelper));

    // dio
    i.addSingleton(() => Dio());
    i.addSingleton(
        () => DioClient(Modular.get<Dio>(), AppEnvironment.apiIsUrl));
    super.binds(i);
  }

  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void routes(RouteManager r) {
    super.routes(r);
    // cac module cua project
    r.module(ModuleRoutes.moduleApp, module: AppModule());
  }
}
