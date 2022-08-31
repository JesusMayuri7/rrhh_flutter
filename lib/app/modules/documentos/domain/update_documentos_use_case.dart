import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/documentos/domain/i_documentos_repository.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import '../../../../core/domain/entities/response_entity.dart';
import 'new_documentos_use_case.dart';

class UpdateDocumentoUseCase
    implements UseCase<ResponseEntity, ParamsNewDocumento> {
  final IDocumentosRepository iDocumentosRepository;

  UpdateDocumentoUseCase({
    required this.iDocumentosRepository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(
      ParamsNewDocumento params) async {
    return await this.iDocumentosRepository.newDocumento(params);
  }
}

class ParamsUpdateDocumento {
  int id;
  int anio;
  String fechaBaja;
  String fechaAlta;
  String codigoBaja;
  String codigoAlta;
  ParamsUpdateDocumento({
    required this.id,
    required this.anio,
    required this.fechaBaja,
    required this.fechaAlta,
    required this.codigoBaja,
    required this.codigoAlta,
  });

  Map<String, dynamic> toMap() {
    return {
      'anio': anio,
      'fechaBaja': fechaBaja,
      'fechaAlta': fechaAlta,
      'codigoBaja': codigoBaja,
      'codigoAlta': codigoAlta,
    };
  }

  factory ParamsUpdateDocumento.fromMap(Map<String, dynamic> map) {
    return ParamsUpdateDocumento(
      id: map['id'],
      anio: map['anio'],
      fechaBaja: map['fechaBaja'],
      fechaAlta: map['fechaAlta'],
      codigoBaja: map['codigoBaja'],
      codigoAlta: map['codigoAlta'],
    );
  }
}
