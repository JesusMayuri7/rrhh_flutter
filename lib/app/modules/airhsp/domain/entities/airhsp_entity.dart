import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AirhspEntity extends Equatable {
  String plaza;
  String nombres;
  String cargo;
  String nivel;
  String establecimiento;
  String dependencia;
  String estado;
  int estadoCant;
  String dni;

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
