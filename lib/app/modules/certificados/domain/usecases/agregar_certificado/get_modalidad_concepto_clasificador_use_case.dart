import 'package:dartz/dartz.dart';
import '../../entities/modalidad_concepto_clasificador_entity.dart';

import '../../repositories/i_certificados_repository.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/domain/use_cases/usecase.dart';

class GetModalidadConceptoClasificadorUseCase
    implements UseCase<ModalidadConceptoClasificadorEntity, NoParams> {
  final ICertificadosRepository repository;

  GetModalidadConceptoClasificadorUseCase(this.repository);

  @override
  Future<Either<Failure, ModalidadConceptoClasificadorEntity>> call(
      NoParams params) async {
    print(' entro al caso de uso getModalidadConceptoClasificador');
    return await repository.modalidadConceptoClasificador();
  }
}
