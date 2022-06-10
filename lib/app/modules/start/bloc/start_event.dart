import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StartEvent extends Equatable {}

class TotalPlazasEvent extends StartEvent {
  final String totalPlazas;

  TotalPlazasEvent({required this.totalPlazas});
  @override
  List<Object> get props => [throw UnimplementedError()];

  @override
  bool? get stringify => true;
}
