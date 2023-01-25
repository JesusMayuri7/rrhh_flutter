import 'package:equatable/equatable.dart';

class BaseCasEntity extends Equatable {
  BaseCasEntity(
      {required this.codigoPlaza,
      required this.anio,
      required this.presupuesto,
      required this.producto,
      required this.descArea,
      required this.sede,
      required this.fuenteBase,
      required this.meta,
      required this.meta2020,
      required this.cargo,
      required this.dni,
      required this.nombres,
      required this.modalidad,
      required this.vigencia,
      required this.estadoOpp,
      required this.estadoActual,
      required this.estadoAir,
      required this.sustentoLegal,
      required this.nroConvocatoria,
      required this.estadoConvocatoria,
      required this.fase,
      required this.fechaAlta,
      required this.tipoIngreso,
      required this.fechaBaja,
      required this.tipoSalida,
      required this.finLicencia,
      required this.detalle,
      this.mesInicio = 0,
      this.mesFin = 0,
      this.monto = 0,
      this.incrementoCas =0,
      this.montoMensual=0,
      this.essalud = 0,
      this.montoAnual = 0,
      this.essaludAnual = 0,
      this.aguinaldoAnual = 0,
      this.total = 0,
      this.sctrSalud = 0,
      this.sctrSaludAnual = 0,
      this.sctrPension = 0,
      this.sctrPensionAnual = 0,
      this.uit = 0});

  final String codigoPlaza;
  final String anio;
  final String presupuesto;
  final String producto;
  final String descArea;
  final String sede;
  final String fuenteBase;
  final String meta;
  final String meta2020;
  final String cargo;
  final String dni;
  final String nombres;
  final String modalidad;
  final String vigencia;
  final String estadoOpp;
  final String estadoActual;
  final String estadoAir;
  final String sustentoLegal;
  final String nroConvocatoria;
  final String estadoConvocatoria;
  final String fase;
  final String tipoIngreso;
  final String fechaAlta;
  final String tipoSalida;
  final String fechaBaja;
  final String finLicencia;
  final int mesInicio;
  final int mesFin;
  final double monto;
  final double incrementoCas;
  final double montoMensual;
  final double essalud;
  final double montoAnual;
  final double essaludAnual;
  final double aguinaldoAnual;
  final double total;
  final double sctrSalud;
  final double sctrSaludAnual;
  final double sctrPension;
  final double sctrPensionAnual;
  final String detalle;
  final double uit;

  Map<String, dynamic> toMap() {
    return {
      'codigoPlaza': codigoPlaza,
      'anio': anio,
      'presupuesto': presupuesto,
      'producto': producto,
      'descArea': descArea,
      'sede': sede,
      'fuenteBase': fuenteBase,
      'meta': meta,
      'meta2020': meta2020,
      'cargo': cargo,
      'dni': dni,
      'nombres': nombres,
      'modalidad': modalidad,
      'vigencia': vigencia,
      'estadoOpp': estadoOpp,
      'estadoActual': estadoActual,
      'estadoAir': estadoAir,
      'sustentoLegal': sustentoLegal,
      'nroConvocatoria': nroConvocatoria,
      'estadoConvocatoria': estadoConvocatoria,
      'fase': fase,
      'tipoIngreso': tipoIngreso,
      'fechaAlta': fechaAlta,
      'tipoSalida': tipoSalida,
      'fechaBaja': fechaBaja,
      'finLicencia': finLicencia,
      'mesIncio': mesInicio,
      'mesFin': mesFin,
      'monto': monto,
      'incrementoCas':incrementoCas,
      'montoMensual':montoMensual,
      'essalud': essalud,
      'montoAnual': montoAnual,
      'essaludAnual': essaludAnual,
      'aguinaldoAnual': aguinaldoAnual,
      'total': total,
      'sctrSaludMensual': sctrSalud,
      'totalSctrSaludAnual': sctrSaludAnual,
      'sctrPensionMensual': sctrPension,
      'totalSctrPensionAnual': sctrPensionAnual,
      'detalle': detalle,
    };
  }

  BaseCasEntity copyWith({
    String? codigoPlaza,
    String? anio,
    String? presupuesto,
    String? producto,
    String? descArea,
    String? sede,
    String? fuenteBase,
    String? meta,
    String? meta2020,
    String? cargo,
    String? dni,
    String? nombres,
    String? modalidad,
    String? vigencia,
    String? estadoOpp,
    String? estadoActual,
    String? estadoAir,
    String? sustentoLegal,
    String? nroConvocatoria,
    String? estadoConvocatoria,
    String? fase,
    String? tipoIngreso,
    String? fechaAlta,
    String? tipoSalida,
    String? fechaBaja,
    int? mesInicio,
    int? mesFin,
    String? finLicencia,
    double? monto,
    double? incrementoCas,
    double? montoMensual,
    double? essalud,
    double? montoAnual,
    double? essaludAnual,
    double? aguinaldoAnual,
    double? total,
    double? sctrSalud,
    double? sctrSaludAnual,
    double? sctrPension,
    double? sctrPensionAnual,
    String? detalle,
    double? uit,
  }) {
    return BaseCasEntity(
      codigoPlaza: codigoPlaza ?? this.codigoPlaza,
      anio: anio ?? this.anio,
      presupuesto: presupuesto ?? this.presupuesto,
      producto: producto ?? this.producto,
      descArea: descArea ?? this.descArea,
      sede: sede ?? this.sede,
      fuenteBase: fuenteBase ?? this.fuenteBase,
      meta: meta ?? this.meta,
      meta2020: meta2020 ?? this.meta2020,
      cargo: cargo ?? this.cargo,
      dni: dni ?? this.dni,
      nombres: nombres ?? this.nombres,
      modalidad: modalidad ?? this.modalidad,
      vigencia: vigencia ?? this.vigencia,
      estadoOpp: estadoOpp ?? this.estadoOpp,
      estadoActual: estadoActual ?? this.estadoActual,
      estadoAir: estadoAir ?? this.estadoAir,
      sustentoLegal: sustentoLegal ?? this.sustentoLegal,
      nroConvocatoria: nroConvocatoria ?? this.nroConvocatoria,
      estadoConvocatoria: estadoConvocatoria ?? this.estadoConvocatoria,
      fase: fase ?? this.fase,
      tipoIngreso: tipoIngreso ?? this.tipoIngreso,
      fechaAlta: fechaAlta ?? this.fechaAlta,
      tipoSalida: tipoSalida ?? this.tipoSalida,
      fechaBaja: fechaBaja ?? this.fechaBaja,
      mesInicio: mesInicio ?? this.mesInicio,
      mesFin: mesFin ?? this.mesFin,
      finLicencia: finLicencia ?? this.finLicencia,
      monto: monto ?? this.monto,
      incrementoCas: incrementoCas ?? this.incrementoCas,
      montoMensual: montoMensual ?? this.montoMensual,
      essalud: essalud ?? this.essalud,
      montoAnual: montoAnual ?? this.montoAnual,
      essaludAnual: essaludAnual ?? this.essaludAnual,
      aguinaldoAnual: aguinaldoAnual ?? this.aguinaldoAnual,
      total: total ?? this.total,
      sctrSalud: sctrSalud ?? this.sctrSalud,
      sctrSaludAnual: sctrSaludAnual ?? this.sctrSaludAnual,
      sctrPension: sctrSalud ?? this.sctrPension,
      sctrPensionAnual: sctrSaludAnual ?? this.sctrPensionAnual,
      detalle: detalle ?? this.detalle,
      uit: uit ?? this.uit,
    );
  }

  BaseCasEntity calcular(
      {
        String? codigoPlaza,
        String? anio,
      String? presupuesto,
      String? producto,
      String? descArea,
      String? sede,
      String? fuenteBase,
      String? meta,
      String? meta2020,
      String? cargo,
      String? dni,
      String? nombres,
      String? modalidad,
      String? vigencia,
      String? estadoOpp,
      String? estadoActual,
      String? estadoAir,
      String? sustentoLegal,
      String? nroConvocatoria,
      String? estadoConvocatoria,
      String? fase,
      String? tipoIngreso,
      String? fechaAlta,
      String? tipoSalida,
      String? fechaBaja,
      final int mesInicio = 0,
      final int mesFin = 0,
      String? finLicencia,
      double? monto,
      String? detalle,
      final double uit = 0,
      final double porcentajeMaximoEssalud = 0,
      final double aguinaldoSemestral = 0,
      final double porcentajeIgv = 0,
      final double incrementoCas = 0,
      final double montoMensual =0,
      final double porcentajeEssalud = 0,
      final double porcentajePrimaSctrSalud = 0,
      final double porcentajePrimaSctrPension = 0,
      final double porcentajeComisionSctrPension = 0}) {
    double _aguinaldoPrimerSemestre = 0;
    double _aguinaldoSegundoSemestre = 0;
    double _aguinaldoAnual = 0;

    double _totalEssalud = 0;
    double _totalSctrSalud = 0;
    double _totalSctrPension = 0;
    double _totalMonto = 0;
    double _totalMontoEssaludAguinaldo = 0;
    int _mesInicio = mesInicio + 1;
    int _mesFin = mesFin + 1;

    int _meses = (mesFin - mesInicio) + 1;

    double _montoMensual = this.monto + this.incrementoCas;

    //Essalud Mensual
    double _essalud = double.parse(
        (_montoMensual >= (uit * (porcentajeMaximoEssalud / 100))
                ? (uit *
                    (porcentajeMaximoEssalud / 100) *
                    (porcentajeEssalud / 100))
                : (_montoMensual * (porcentajeEssalud / 100)))
            .toStringAsFixed(2));

    //SctrSalud Mensual
    double _sctrSalud = (porcentajePrimaSctrSalud / 100) *
        ((porcentajeIgv / 100) + 1) *
        _montoMensual;

    // SctrPension Mensual
    double _sctrPension = double.parse(((porcentajePrimaSctrPension / 100) *
            ((porcentajeIgv / 100) + 1) *
            ((porcentajeComisionSctrPension / 100) + 1) *
            _montoMensual)
        .toStringAsFixed(2));

    //Aguinaldo Semestral
    if (_mesFin >= 6) {
      if (_mesInicio < 5) _aguinaldoPrimerSemestre = aguinaldoSemestral;
      if (_mesInicio == 5) _aguinaldoPrimerSemestre = aguinaldoSemestral - 100;
      if (_mesInicio == 6) _aguinaldoPrimerSemestre = aguinaldoSemestral - 200;
      if (_mesFin >= 11) {
        if (_mesInicio < 10) _aguinaldoSegundoSemestre = aguinaldoSemestral;
        if (_mesInicio == 10)
          _aguinaldoSegundoSemestre = aguinaldoSemestral - 100;
        if (_mesInicio == 11)
          _aguinaldoSegundoSemestre = aguinaldoSemestral - 200;
      }
    }

    // Montos Anuales
    _totalMonto = _montoMensual * _meses;
    _totalEssalud = _essalud * _meses;
    _aguinaldoAnual = _aguinaldoPrimerSemestre + _aguinaldoSegundoSemestre;

    //SctrSalud Anual
    _totalSctrSalud = (_sctrSalud * _meses) +
        ((porcentajePrimaSctrSalud / 100) *
            ((porcentajeIgv / 100) + 1) *
            (_aguinaldoAnual));

    //SctrPension Anual
    _totalSctrPension = double.parse(((_sctrPension * _meses) +
            ((porcentajePrimaSctrPension / 100) *
                ((porcentajeIgv / 100) + 1) *
                ((porcentajeComisionSctrPension / 100) + 1) *
                (_aguinaldoAnual)))
        .toStringAsFixed(2));
    _totalMontoEssaludAguinaldo = _totalMonto + _totalEssalud + _aguinaldoAnual;

    return BaseCasEntity(
      codigoPlaza: codigoPlaza ?? this.codigoPlaza,
      anio: anio ?? this.anio,
      presupuesto: presupuesto ?? this.presupuesto,
      producto: producto ?? this.producto,
      descArea: descArea ?? this.descArea,
      sede: sede ?? this.sede,
      fuenteBase: fuenteBase ?? this.fuenteBase,
      meta: meta ?? this.meta,
      meta2020: meta2020 ?? this.meta2020,
      cargo: cargo ?? this.cargo,
      dni: dni ?? this.dni,
      nombres: nombres ?? this.nombres,
      modalidad: modalidad ?? this.modalidad,
      vigencia: vigencia ?? this.vigencia,
      estadoActual: estadoActual ?? this.estadoActual,
      estadoOpp: estadoOpp ?? this.estadoOpp,
      estadoAir: estadoAir ?? this.estadoAir,
      sustentoLegal: sustentoLegal ?? this.sustentoLegal,
      nroConvocatoria: nroConvocatoria ?? this.nroConvocatoria,
      estadoConvocatoria: estadoConvocatoria ?? this.estadoConvocatoria,
      fase: fase ?? this.fase,
      tipoIngreso: tipoIngreso ?? this.tipoIngreso,
      fechaAlta: fechaAlta ?? this.fechaAlta,
      tipoSalida: tipoSalida ?? this.tipoSalida,
      fechaBaja: fechaBaja ?? this.fechaBaja,
      mesInicio: _mesInicio,
      mesFin: _mesFin,
      finLicencia: finLicencia ?? this.finLicencia,
      monto: monto ?? _montoMensual,
      incrementoCas: incrementoCas,
      montoMensual: _montoMensual,
      essalud: _essalud,
      montoAnual: _totalMonto,
      essaludAnual: _totalEssalud,
      aguinaldoAnual: _aguinaldoAnual,
      total: _totalMontoEssaludAguinaldo,
      sctrSalud: _sctrSalud,
      sctrSaludAnual: _totalSctrSalud,
      sctrPension: _sctrPension,
      sctrPensionAnual: _totalSctrPension,
      detalle: detalle ?? this.detalle,
    );
  }

  @override
  List<Object> get props {
    return [
      codigoPlaza,
      anio,
      presupuesto,
      producto,
      descArea,
      sede,
      fuenteBase,
      meta,
      meta2020,
      cargo,
      dni,
      nombres,
      modalidad,
      vigencia,
      estadoActual,
      estadoAir,
      sustentoLegal,
      nroConvocatoria,
      estadoConvocatoria,
      fase,
      fechaAlta,
      fechaBaja,
      mesInicio,
      mesFin,
      finLicencia,
      monto,
      essalud,
      montoAnual,
      essaludAnual,
      aguinaldoAnual,
      total,
      sctrSalud,
      sctrSaludAnual,
      sctrPension,
      sctrPensionAnual,
      detalle,
      uit,
    ];
  }
}
