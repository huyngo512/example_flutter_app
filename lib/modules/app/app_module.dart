import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/modules/app/data/datasources/remote/app_api.dart';
import 'package:modular_app/modules/app/data/repositories/app_repository.dart';
import 'package:modular_app/modules/app/general/constants/app_routes.dart';
import 'package:modular_app/modules/app/presentation/blocs/app_config/app_config_bloc.dart';
import 'package:modular_app/modules/app/presentation/pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // các class được khởi tạo trong module và sẽ mất khi thoát khỏi module
    super.binds(i);
  }

  @override
  void exportedBinds(Injector i) {
    // các class được khởi tạo khi được gọi và sẽ không mất khi thoát khỏi module
    i.addSingleton(() => AppApi());
    i.addSingleton(() => AppRepository(api: Modular.get<AppApi>()));
    i.addSingleton(
        () => AppConfigBloc(repository: Modular.get<AppRepository>()));
    super.exportedBinds(i);
  }

  @override
  void routes(RouteManager r) {
    //danh sach cac route trong app module
    r.child(
      AppRoutes.home,
      child: (context) => const HomePage(),
    );
    super.routes(r);
  }
}
