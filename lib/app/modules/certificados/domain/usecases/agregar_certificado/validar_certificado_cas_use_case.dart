import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../repositories/i_certificados_repository.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/domain/use_cases/usecase.dart';

class ValidarCertificadoUseCase
    implements UseCase<ResponseEntity, ParamsValidar> {
  final ICertificadosRepository repository;

  ValidarCertificadoUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsValidar params) async {
    return await repository.validarCertificado(
        certificado: params.certificado, anio: params.anio);
  }
}

class ParamsValidar extends Equatable {
  final String certificado;
  final String anio;
  ParamsValidar({
    required this.anio,
    required this.certificado,
  });

  @override
  List<Object?> get props => [this.certificado, this.anio];
}
