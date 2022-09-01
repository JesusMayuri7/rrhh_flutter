// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class JudicialEntity extends Equatable {
  JudicialEntity(
      {required this.id,
      required this.anio,
      required this.presupuesto,
      required this.fuente,
      required this.fuenteId,
      required this.descArea,
      required this.orgAreaId,
      required this.finalidad,
      required this.metaId,
      required this.cargo,
      required this.fechaIngreso,
      required this.dni,
      required this.nombres,
      required this.nroExpedienteJudicial,
      required this.detalle,
      required this.montoJudicial,
      required this.montoPlanilla,
      required this.estadoProcesal,
      required this.expedientePvn,
      required this.expedienteMtc,
      required this.expedienteMef,
      required this.codigoPlaza,
      required this.nroCap,
      required this.documentoOrh,
      required this.observacion,
      required this.descEscala});

  final int id;
  final String anio;
  final String presupuesto;
  final String fuente;
  final int fuenteId;
  final String descArea;
  final int orgAreaId;
  final String nombres;
  final String finalidad;
  final int metaId;
  final String cargo;
  final String fechaIngreso;
  final String dni;
  final num montoJudicial;
  final num montoPlanilla;
  final String nroExpedienteJudicial;
  final String detalle;
  final String estadoProcesal;
  final String expedientePvn;
  final String expedienteMtc;
  final String expedienteMef;
  final String observacion;
  final String documentoOrh;
  final String codigoPlaza;
  final String nroCap;
  final String descEscala;

  factory JudicialEntity.empty() {
    return JudicialEntity(
        id: 0,
        anio: "2022",
        presupuesto: 'NO_PREVISTA',
        fuente: '',
        fuenteId: 0,
        descArea: '',
        orgAreaId: 0,
        finalidad: '',
        metaId: 0,
        cargo: '',
        fechaIngreso: '',
        dni: '',
        nombres: '',
        nroExpedienteJudicial: '',
        expedientePvn: '',
        expedienteMtc: '',
        expedienteMef: '',
        detalle: '',
        montoJudicial: 0,
        montoPlanilla: 0,
        estadoProcesal: 'SEGUIMIENTO',
        observacion: '',
        documentoOrh: '',
        codigoPlaza: '',
        nroCap: '',
        descEscala: '');
  }

  @override
  List<Object> get props {
    return [
      anio,
      id,
      presupuesto,
      fuente,
      fuenteId,
      descArea,
      orgAreaId,
      finalidad,
      metaId,
      nombres,
      cargo,
      fechaIngreso,
      montoJudicial,
      montoPlanilla,
      dni,
      nombres,
      nroExpedienteJudicial,
      expedientePvn,
      expedienteMtc,
      expedienteMef,
      detalle,
      estadoProcesal,
      observacion,
      documentoOrh,
      codigoPlaza,
      nroCap,
      descEscala
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'anio': anio,
      'presupuesto': presupuesto,
      'fuente': fuente,
      'fuente_id': fuenteId,
      'descArea': descArea,
      'org_area_id': orgAreaId,
      'nombres': nombres,
      'finalidad': finalidad,
      'meta_id': metaId,
      'cargo': cargo,
      'fecha_ingreso': fechaIngreso,
      'dni': dni,
      'monto_judicial': montoJudicial,
      'monto_planilla': montoPlanilla,
      'nro_expediente_judicial': nroExpedienteJudicial,
      'detalle': detalle,
      'estado_procesal': estadoProcesal,
      'expediente_pvn': expedientePvn,
      'expediente_mtc': expedienteMtc,
      'expediente_mef': expedienteMef,
      'observacion': observacion,
      'documento_orh': documentoOrh,
      'codigo_plaza': codigoPlaza,
      'nro_cap': nroCap,
      'desc_escala': descEscala,
    };
  }
}
