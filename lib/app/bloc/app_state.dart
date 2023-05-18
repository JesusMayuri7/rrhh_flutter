// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/core/domain/entities/session_entity.dart';

abstract class AppState extends Equatable {
  final SessionEntity? sessionEntity;
  AppState({
    this.sessionEntity,
  });

  @override
  bool get stringify => true;
}

class InitialAppState extends AppState {
  InitialAppState({
    required super.sessionEntity,
  });

  @override
  List<Object> get props => [sessionEntity!];
}

class AppLoggedState extends AppState {
  AppLoggedState({required super.sessionEntity});

  @override
  List<Object> get props => [sessionEntity!];
}

class AppLogoutState extends AppState {
  AppLogoutState({required super.sessionEntity});

  @override
  List<Object> get props => [sessionEntity!];
}
