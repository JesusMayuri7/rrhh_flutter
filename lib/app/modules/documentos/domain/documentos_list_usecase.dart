import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'i_documentos_repository.dart';

class DocumentosListUseCase extends UseCase<ResponseEntity, ParamsDocumentos> {
  final IDocumentosRepository iDocumentosRepository;

  DocumentosListUseCase({required this.iDocumentosRepository});

  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsDocumentos params) async {
    return await iDocumentosRepository.getListDocumentos(params);
  }
}

class ParamsDocumentos {
  final String anio;

  ParamsDocumentos({
    required this.anio,
  });
}
