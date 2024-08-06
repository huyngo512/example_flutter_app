import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/core/constants/app_environment.dart';
import 'package:modular_app/main_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: AppEnvironment.envFileName);
  final preHelper = await SharedPreferences.getInstance();
  runApp(ModularApp(
    module: MainModule(preHelper: preHelper),
    child: const MainWidget(),
  ));
}
