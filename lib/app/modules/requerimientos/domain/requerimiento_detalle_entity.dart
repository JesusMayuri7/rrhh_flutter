import 'package:equatable/equatable.dart';

class RequerimientoDetalleEntity extends Equatable {
  RequerimientoDetalleEntity({
    required this.cargo,
    required this.monto,
    required this.cantidad,
    required this.subAreaId,
    required this.descSubarea,
    required this.requerimientoId,
  });

  final String cargo;
  final int monto;
  final int cantidad;
  final int subAreaId;
  final String descSubarea;
  final int requerimientoId;

  @override
  List<Object> get props {
    return [
      cargo,
      monto,
      cantidad,
      subAreaId,
      descSubarea,
      requerimientoId,
    ];
  }
}
