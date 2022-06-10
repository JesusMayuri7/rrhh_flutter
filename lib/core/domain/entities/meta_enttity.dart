import 'package:equatable/equatable.dart';

class MetaEntity extends Equatable {
  final int idmetaAnual;
  final int anio;
  final String presupuesto;
  final String meta;
  final String finalidad;
  final String producto;
  final String actividad;

  MetaEntity({
    required this.idmetaAnual,
    required this.anio,
    required this.presupuesto,
    required this.meta,
    required this.finalidad,
    required this.producto,
    required this.actividad,
  });

  @override
  String toString() {
    return 'MetaEntity(idmetaAnual: $idmetaAnual, anio: $anio, presupuesto: $presupuesto, meta: $meta, finalidad: $finalidad, producto: $producto, actividad: $actividad)';
  }

  @override
  List<Object> get props {
    return [
      idmetaAnual,
      anio,
      presupuesto,
      meta,
      finalidad,
      producto,
      actividad,
    ];
  }
}
