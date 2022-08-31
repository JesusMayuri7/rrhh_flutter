// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/documentos/domain/i_documentos_repository.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import '../../../../core/domain/entities/response_entity.dart';

class NewDocumentoUseCase
    implements UseCase<ResponseEntity, ParamsNewDocumento> {
  final IDocumentosRepository iDocumentosRepository;

  NewDocumentoUseCase({
    required this.iDocumentosRepository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(
      ParamsNewDocumento params) async {
    return await this.iDocumentosRepository.newDocumento(params);
  }
}

class ParamsNewDocumento {
  int? id;
  String anio;
  String asunto;
  String remite;
  String destino;
  String tipo;
  String estado;
  String expedientePvn;
  String expedienteMtc;
  String expedienteMef;
  String fecha;
  String numeroPvn;
  String detalle;
  ParamsNewDocumento({
    required this.id,
    required this.anio,
    required this.asunto,
    required this.remite,
    required this.destino,
    required this.tipo,
    required this.estado,
    required this.expedientePvn,
    required this.expedienteMtc,
    required this.expedienteMef,
    required this.fecha,
    required this.numeroPvn,
    required this.detalle,
  });

  factory ParamsNewDocumento.fromMap(Map<String, dynamic> map) {
    return ParamsNewDocumento(
      id: map['id'] != null ? map['id'] as int : null,
      anio: map['anio'] as String,
      asunto: map['asunto'] as String,
      remite: map['remite'] as String,
      destino: map['destino'] as String,
      tipo: map['tipo'] as String,
      estado: map['estado'] as String,
      expedientePvn: map['expediente_pvn'] as String,
      expedienteMtc: map['expediente_mtc'] as String,
      expedienteMef: map['expediente_mef'] as String,
      fecha: map['fecha'] as String,
      numeroPvn: map['numero_pvn'] as String,
      detalle: map['detalle'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'anio': anio,
      'asunto': asunto,
      'remite': remite,
      'destino': destino,
      'tipo': tipo,
      'estado': estado,
      'expediente_pvn': expedientePvn,
      'expediente_mtc': expedienteMtc,
      'expediente_mef': expedienteMef,
      'fecha': fecha,
      'numero_pvn': numeroPvn,
      'detalle': detalle,
    };
  }

  @override
  String toString() {
    return 'ParamsNewDocumento(id: $id, anio: $anio, asunto: $asunto, remite: $remite, destino: $destino, tipo: $tipo, estado: $estado, expedientePvn: $expedientePvn, expedienteMtc: $expedienteMtc, expedienteMef: $expedienteMef, fecha: $fecha, numeroPvn: $numeroPvn, detalle: $detalle)';
  }
}
