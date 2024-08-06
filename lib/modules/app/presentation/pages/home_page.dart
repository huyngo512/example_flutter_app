import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modular_app/modules/app/presentation/blocs/app_config/app_config_bloc.dart';
import 'package:modular_app/modules/app/presentation/blocs/app_config/app_config_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigBloc, AppConfigState>(
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text("Hello"),
          ),
        );
      },
    );
  }
}
