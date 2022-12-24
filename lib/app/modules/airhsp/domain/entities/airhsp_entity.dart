import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AirhspEntity extends Equatable {
  final String plaza;
  final String nombres;
  final String cargo;
  final String nivel;
  final String establecimiento;
  final String dependencia;
  final String estado;
  final int estadoCant;
  final String dni;

  AirhspEntity(
      {required this.plaza,
      required this.nivel,
      required this.establecimiento,
      required this.nombres,
      required this.cargo,
      required this.dependencia,
      required this.estado,
      required this.dni,
      required this.estadoCant});

  @override
  List<Object> get props {
    return [
      plaza,
      nombres,
      cargo,
      nivel,
      establecimiento,
      dependencia,
      estado,
      estadoCant,
      dni,
    ];
  }
}
