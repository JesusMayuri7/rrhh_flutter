import 'package:equatable/equatable.dart';

class CapEstadoOppEntity extends Equatable {
  CapEstadoOppEntity({
    required this.orgUId,
    required this.modalidad,
    required this.descUnidad,
    required this.ocupado,
    required this.vacante,
    required this.reservado,
  });

  final int orgUId;
  final String modalidad;
  final String descUnidad;
  final int ocupado;
  final int vacante;
  final int reservado;

  @override
  String toString() {
    return 'CapEstadoOppEntity(orgUId: $orgUId, modalidad: $modalidad, descUnidad: $descUnidad, ocupado: $ocupado, vacante: $vacante, reservado: $reservado)';
  }

  @override
  List<Object> get props {
    return [
      orgUId,
      modalidad,
      descUnidad,
      ocupado,
      vacante,
      reservado,
    ];
  }
}
