import 'package:equatable/equatable.dart';

class MetaEntity extends Equatable {
  final int idmetaAnual;
  final String finalidad;
  final int? anio;
  final String? presupuesto;
  final String? meta;
  final String? producto;
  final String? actividad;

  MetaEntity({
    required this.idmetaAnual,
    required this.finalidad,
    this.anio,
    this.presupuesto,
    this.meta,
    this.producto,
    this.actividad,
  });

  @override
  String toString() {
    return 'MetaEntity(idmetaAnual: $idmetaAnual, anio: $anio, presupuesto: $presupuesto, meta: $meta, finalidad: $finalidad, producto: $producto, actividad: $actividad)';
  }

  @override
  List<Object> get props {
    return [
      idmetaAnual,
      finalidad,
    ];
  }
}
