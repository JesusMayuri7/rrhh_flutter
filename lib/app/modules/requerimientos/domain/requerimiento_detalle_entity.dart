// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class RequerimientoDetalleEntity extends Equatable {
  RequerimientoDetalleEntity({
    required this.cargo,
    required this.monto,
    required this.cantidad,
    required this.subAreaId,
    required this.descSubarea,
    required this.id,
    required this.fuenteId,
    required this.descFuente,
    required this.metaId,
    required this.descMeta,
  });

  final String cargo;
  final num monto;
  final int cantidad;
  final int subAreaId;
  final String descSubarea;
  final int id;
  final int fuenteId;
  final String descFuente;
  final int metaId;
  final String descMeta;

  @override
  List<Object> get props {
    return [
      cargo,
      monto,
      cantidad,
      subAreaId,
      descSubarea,
      id,
      fuenteId,
      descFuente,
    ];
  }

  @override
  bool get stringify => true;
}
