import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/core/constants/module_routes.dart';
import 'package:modular_app/modules/app/general/constants/app_routes.dart';
import 'package:modular_app/modules/app/presentation/blocs/app_config/app_config_bloc.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  void initState() {
    Modular.setInitialRoute('${ModuleRoutes.moduleApp}${AppRoutes.home}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // blocs in global app
        BlocProvider.value(value: Modular.get<AppConfigBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
