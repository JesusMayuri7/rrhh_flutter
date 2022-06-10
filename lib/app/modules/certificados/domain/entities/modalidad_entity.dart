import 'package:equatable/equatable.dart';

class ModalidadEntity extends Equatable {
  final int id;
  final String dscModalidad;

  ModalidadEntity({required this.id, required this.dscModalidad});
  @override
  List<Object?> get props => [id, dscModalidad];
}
