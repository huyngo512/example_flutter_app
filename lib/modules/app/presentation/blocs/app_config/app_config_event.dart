import 'package:equatable/equatable.dart';

sealed class AppConfigEvent extends Equatable {
  const AppConfigEvent();

  @override
  List<Object> get props => [];
}

final class AppGetConfigListRequested extends AppConfigEvent {
  const AppGetConfigListRequested();
}
