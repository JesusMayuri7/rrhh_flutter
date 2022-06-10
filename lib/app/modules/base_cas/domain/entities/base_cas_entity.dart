import 'package:equatable/equatable.dart';

class BaseCasEntity extends Equatable {
  BaseCasEntity(
      {required this.codigoPlaza,
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
      required this.estadoActual,
      required this.estadoAir,
      required this.sustentoLegal,
      required this.nroConvocatoria,
      required this.estadoConvocatoria,
      required this.resultadoConvocatoria,
      required this.fechaAlta,
      required this.fechaBaja,
      required this.detalle,
      this.mesInicio = 0,
      this.mesFin = 0,
      required this.monto,
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
  final String estadoActual;
  final String estadoAir;
  final String sustentoLegal;
  final String nroConvocatoria;
  final String estadoConvocatoria;
  final String resultadoConvocatoria;
  final String fechaAlta;
  final String fechaBaja;
  final int mesInicio;
  final int mesFin;
  final double monto;
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
      'estadoActual': estadoActual,
      'estadoAir': estadoAir,
      'sustentoLegal': sustentoLegal,
      'nroConvocatoria': nroConvocatoria,
      'estadoConvocatoria': estadoConvocatoria,
      'resultadoConvocatoria': resultadoConvocatoria,
      'fechaAlta': fechaAlta,
      'fechaBaja': fechaBaja,
      'mesIncio': mesInicio,
      'mesFin': mesFin,
      'monto': monto,
      'essalud': essalud,
      'montoAnual': montoAnual,
      'essaludAnual': essaludAnual,
      'aguinaldoAnual': aguinaldoAnual,
      'total': total,
      'sctrSaludAnual': sctrSalud,
      'totalSctrSaludAnual': sctrSaludAnual,
      'sctrPensionAnual': sctrPension,
      'totalSctrPensionAnual': sctrPensionAnual,
      'detalle': detalle,
    };
  }

  BaseCasEntity copyWith({
    String? codigoPlaza,
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
    String? estadoActual,
    String? estadoAir,
    String? sustentoLegal,
    String? nroConvocatoria,
    String? estadoConvocatoria,
    String? resultadoConvocatoria,
    String? fechaAlta,
    String? fechaBaja,
    int? mesInicio,
    int? mesFin,
    double? monto,
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
      estadoAir: estadoAir ?? this.estadoAir,
      sustentoLegal: sustentoLegal ?? this.sustentoLegal,
      nroConvocatoria: nroConvocatoria ?? this.nroConvocatoria,
      estadoConvocatoria: estadoConvocatoria ?? this.estadoConvocatoria,
      resultadoConvocatoria:
          resultadoConvocatoria ?? this.resultadoConvocatoria,
      fechaAlta: fechaAlta ?? this.fechaAlta,
      fechaBaja: fechaBaja ?? this.fechaBaja,
      mesInicio: mesInicio ?? this.mesInicio,
      mesFin: mesFin ?? this.mesFin,
      monto: monto ?? this.monto,
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

  @override
  List<Object> get props {
    return [
      codigoPlaza,
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
      resultadoConvocatoria,
      fechaAlta,
      fechaBaja,
      mesInicio,
      mesFin,
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
