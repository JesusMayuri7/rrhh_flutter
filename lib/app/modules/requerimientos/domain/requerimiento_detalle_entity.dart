// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class RequerimientoDetalleEntity extends Equatable {
  RequerimientoDetalleEntity({
    required this.cargo,
    required this.monto,
    required this.cantidad,
    required this.areaId,
    required this.descArea,
    required this.id,
    required this.fuenteId,
    required this.descFuente,
    required this.metaId,
    required this.descMeta,
  });

  final String cargo;
  final num monto;
  final int cantidad;
  final int areaId;
  final String descArea;
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
      areaId,
      descArea,
      id,
      fuenteId,
      descFuente,
    ];
  }

  @override
  bool get stringify => true;

  RequerimientoDetalleEntity copyWith({
    String? cargo,
    num? monto,
    int? cantidad,
    int? areaId,
    String? descArea,
    int? id,
    int? fuenteId,
    String? descFuente,
    int? metaId,
    String? descMeta,
  }) {
    return RequerimientoDetalleEntity(
      cargo: cargo ?? this.cargo,
      monto: monto ?? this.monto,
      cantidad: cantidad ?? this.cantidad,
      areaId: areaId ?? this.areaId,
      descArea: descArea ?? this.descArea,
      id: id ?? this.id,
      fuenteId: fuenteId ?? this.fuenteId,
      descFuente: descFuente ?? this.descFuente,
      metaId: metaId ?? this.metaId,
      descMeta: descMeta ?? this.descMeta,
    );
  }
}
