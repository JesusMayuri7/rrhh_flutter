class BaseCasEntity {
  BaseCasEntity({
    required this.codigoPlaza,
    required this.presupuesto,
    required this.descUnidad,
    required this.descArea,
    required this.sede,
    required this.fuenteBase,
    required this.meta,
    required this.meta2020,
    required this.cargo,
    required this.dni,
    required this.nombres,
    required this.estado,
    required this.modalidad,
    required this.vigencia,
    required this.estadoAir,
    required this.monto,
    this.meses = 0,
    this.essalud = 0,
    this.montoAnual = 0,
    this.essaludAnual = 0,
    this.aguinaldoAnual = 0,
    this.total = 0,
    this.totalAcumulado = 0,
  });

  String? codigoPlaza;
  String? presupuesto;
  String? descUnidad;
  String? descArea;
  String? sede;
  String? fuenteBase;
  String? meta;
  String? meta2020;
  String? cargo;
  String? dni;
  String? nombres;
  String? estado;
  String? modalidad;
  String? vigencia;
  String? estadoAir;
  double? monto;
  double essalud;
  int meses;
  double montoAnual;
  double essaludAnual;
  double aguinaldoAnual;
  double total;
  double totalAcumulado;
}
