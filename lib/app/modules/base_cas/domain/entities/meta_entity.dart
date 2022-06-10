enum Presupuesto { SEDE, ZONAL, OBRERO, PEAJE }

class Meta {
  Meta({
    required this.idmetaAnual,
    required this.anio,
    required this.presupuesto,
    required this.meta,
    required this.finalidad,
    required this.producto,
    required this.actividad,
  });

  final int idmetaAnual;
  final int anio;
  final Presupuesto presupuesto;
  final String meta;
  final String finalidad;
  final String producto;
  final String actividad;

  Meta copyWith({
    int? idmetaAnual,
    int? anio,
    Presupuesto? presupuesto,
    String? meta,
    String? finalidad,
    String? producto,
    String? actividad,
  }) =>
      Meta(
        idmetaAnual: idmetaAnual ?? this.idmetaAnual,
        anio: anio ?? this.anio,
        presupuesto: presupuesto ?? this.presupuesto,
        meta: meta ?? this.meta,
        finalidad: finalidad ?? this.finalidad,
        producto: producto ?? this.producto,
        actividad: actividad ?? this.actividad,
      );

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        idmetaAnual: json["idmeta_anual"],
        anio: json["anio"],
        presupuesto: json["presupuesto"],
        meta: json["meta"],
        finalidad: json["finalidad"],
        producto: json["producto"],
        actividad: json["actividad"],
      );

  Map<String, dynamic> toMap() => {
        "idmeta_anual": idmetaAnual,
        "anio": anio,
        "presupuesto": presupuesto,
        "meta": meta,
        "finalidad": finalidad,
        "producto": producto,
        "actividad": actividad,
      };
}
