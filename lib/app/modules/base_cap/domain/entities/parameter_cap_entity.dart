class ParameterCapEntity {
  final int id;
  final String dscVariable;
  final int modalidadId;
  final String anio;
  final String detalle;
  final String tipo;
  final double valor;
  final String abreviatura;
  final String frecuencia;
  final String modalidadEntrega;
  final List<int> meses;
  final int mesInicio;
  final int mesFin;

  ParameterCapEntity({
    required this.id,
    required this.dscVariable,
    required this.modalidadId,
    required this.anio,
    required this.detalle,
    required this.tipo,
    required this.valor,
    required this.abreviatura,
    required this.frecuencia,
    required this.modalidadEntrega,
    required this.meses,
    this.mesInicio = 1,
    this.mesFin = 12,
  });

  factory ParameterCapEntity.fromMap(Map<String, dynamic> json) =>
      ParameterCapEntity(
        id: json['id'],
        dscVariable: json['dscVariable'],
        modalidadId: json['modalidadId'],
        anio: json['anio'],
        detalle: json['detalle'],
        tipo: json['tipo'],
        valor: json['valor'],
        abreviatura: json['abreviatura'],
        meses: json['meses'],
        frecuencia: json['meses'],
        modalidadEntrega: '',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'dscVariable': dscVariable,
        'modalidadId': modalidadId,
        'anio': anio,
        'detalle': detalle,
        'tipo': tipo,
        'valor': valor,
        'abreviatura': abreviatura,
        'frecuencia': frecuencia,
        'modalidad_entrega': modalidadEntrega,
        'meses': meses,
        'mesInicio': mesInicio,
        'mesFin': mesFin
      };

  @override
  String toString() {
    return 'ParameterCapEntity(id: $id, dscVariable: $dscVariable, modalidadId: $modalidadId, anio: $anio, detalle: $detalle, tipo: $tipo, valor: $valor, abreviatura: $abreviatura, frecuencia: $frecuencia, modalidadEntrega: $modalidadEntrega, meses: $meses, mesInicio: $mesInicio, mesFin: $mesFin)';
  }
}
