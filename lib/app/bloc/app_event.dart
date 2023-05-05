// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/core/domain/entities/session_entity.dart';

abstract class AppEvent extends Equatable {
  final SessionEntity? sessionEntity;
  AppEvent({
    required this.sessionEntity,
  });
}

class AppLogingEvent extends AppEvent {
  AppLogingEvent({required super.sessionEntity});

  @override
  List<Object?> get props => [sessionEntity];
}

class AppInitEvent extends AppEvent {
  AppInitEvent() : super(sessionEntity: null);

  @override
  List<Object?> get props => [sessionEntity];
}

class AppLogoutEvent extends AppEvent {
  AppLogoutEvent() : super(sessionEntity: null);
  @override
  List<Object?> get props => [sessionEntity];
}
