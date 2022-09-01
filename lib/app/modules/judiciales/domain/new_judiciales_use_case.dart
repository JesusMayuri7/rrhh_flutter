// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import '../../../../core/domain/entities/response_entity.dart';
import 'i_judiciales_repository.dart';

class NewJudicialUseCase implements UseCase<ResponseEntity, ParamsNewJudicial> {
  final IJudicialesRepository iJudicialesRepository;

  NewJudicialUseCase({
    required this.iJudicialesRepository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsNewJudicial params) async {
    return await this.iJudicialesRepository.newJudicial(params);
  }
}

class ParamsNewJudicial {
  int? id;
  String anio;
  String presupuesto;
  int fuenteId;
  int orgAreaId;
  int metaId;
  String cargo;
  String fecha;
  String dni;
  String nombres;
  num montoJudicial;
  num montoPlanilla;
  String nroExpedienteJudicial;
  String estadoProcesal;
  String detalle;
  String expedientePvn;
  String expedienteMtc;
  String expedienteMef;
  String codigoPlaza;
  String documentoOrh;
  String nroCap;
  String descEscala;
  String observacion;

  ParamsNewJudicial({
    required this.id,
    required this.anio,
    required this.presupuesto,
    required this.fuenteId,
    required this.orgAreaId,
    required this.metaId,
    required this.cargo,
    required this.fecha,
    required this.dni,
    required this.nombres,
    required this.montoJudicial,
    required this.montoPlanilla,
    required this.nroExpedienteJudicial,
    required this.expedientePvn,
    required this.expedienteMtc,
    required this.expedienteMef,
    required this.estadoProcesal,
    required this.detalle,
    required this.codigoPlaza,
    required this.documentoOrh,
    required this.nroCap,
    required this.descEscala,
    required this.observacion,
  });

  factory ParamsNewJudicial.fromMap(Map<String, dynamic> map) {
    return ParamsNewJudicial(
      id: map['id'] != null ? map['id'] as int : null,
      anio: map['anio'] as String,
      presupuesto: map['presupuesto'] as String,
      fuenteId: map['fuente_id'] as int,
      orgAreaId: map['org_area_id'] as int,
      metaId: map['meta_d'] as int,
      cargo: map['cargo'] as String,
      dni: map['dni'] as String,
      fecha: map['fecha'] as String,
      nombres: map['nombres'] as String,
      montoJudicial: map['monto_judicial'] as num,
      montoPlanilla: map['monto_planilla'] as num,
      nroExpedienteJudicial: map['nro_expediente_judicial'] as String,
      expedientePvn: map['expediente_pvn'] as String,
      expedienteMtc: map['expediente_mtc'] as String,
      expedienteMef: map['expediente_mef'] as String,
      estadoProcesal: map['estado_procesal'] as String,
      detalle: map['detalle'] as String,
      codigoPlaza: map['codigo_plaza'] as String,
      documentoOrh: map['documento_orh'] as String,
      nroCap: map['nro_cap'] as String,
      descEscala: map['desc_escala'] as String,
      observacion: map['observacion'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'anio': anio,
      'presupuesto': presupuesto,
      'fuente_id': fuenteId,
      'org_area_id': orgAreaId,
      'meta_id': metaId,
      'cargo': cargo,
      'dni': dni,
      'nombres': nombres,
      'monto_judicial': montoJudicial,
      'monto_planilla': montoPlanilla,
      'nro_expediente_judicial': nroExpedienteJudicial,
      'expediente_pvn': expedientePvn,
      'expediente_mtc': expedienteMtc,
      'expediente_mef': expedienteMef,
      'estado_procesal': estadoProcesal,
      'detalle': detalle,
      'codigo_plaza': codigoPlaza,
      'documento_orh': documentoOrh,
      'nro_cap': nroCap,
      'desc_escala': descEscala,
      'observacion': observacion,
    };
  }
}
