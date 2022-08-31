// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class JudicialEntity extends Equatable {
  JudicialEntity(
      {required this.id,
      required this.anio,
      required this.presupuesto,
      required this.fuente,
      required this.descArea,
      required this.finalidad,
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
  final String descArea;
  final String nombres;
  final String finalidad;
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
        anio: '',
        presupuesto: '',
        fuente: '',
        descArea: '',
        finalidad: '',
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
        estadoProcesal: '',
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
      descArea,
      finalidad,
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
      'descArea': descArea,
      'nombres': nombres,
      'finalidad': finalidad,
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
