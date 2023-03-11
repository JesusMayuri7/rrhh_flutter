// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_judiciales_repository.dart';

class NewJudicialDetailUseCase extends UseCase<ResponseEntity,ParamsNewJudicialDetail> {
  
  final IJudicialesRepository iJudicialesRepository;

  NewJudicialDetailUseCase({
    required this.iJudicialesRepository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(params) async {
    return await this.iJudicialesRepository.newJudicialDetail(params);
  }
}

class ParamsNewJudicialDetail {
    int? id;
    int? judicialId;
    String? detalle;
    String? expedientePvn;
    String? nroDocumento;
    String? fechaExpedientePvn;    
  ParamsNewJudicialDetail({
    this.id,
    this.judicialId,
    this.detalle,
    this.expedientePvn,
    this.nroDocumento,
    this.fechaExpedientePvn,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'judicial_id': judicialId,
      'detalle': detalle,
      'expediente_pvn': expedientePvn,
      'nro_documento': nroDocumento,
      'fecha_expediente_pvn': fechaExpedientePvn,
    };
  }
}
