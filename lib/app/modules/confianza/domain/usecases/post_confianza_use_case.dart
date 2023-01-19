import 'package:dartz/dartz.dart';
import '../entities/confianza_entity.dart';

import '../repository/confianza_respository.dart';

import '../../../../../core/domain/entities/response_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class PostConfianzaUseCase implements UseCase<ResponseEntity, ConfianzaEntity> {
  final IConfianzaRepository repository;

  PostConfianzaUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ResponseEntity>> call(ConfianzaEntity params) async {
    return await repository.postConfianza(
        id: params.id,
        anio: params.anio,
        dni: params.dni,
        nombres: params.nombres,
        cargo: params.cargo,
        detalle: params.detalle,
        direccion: params.direccion,
        docCese: params.docCese,
        docDesignacion: params.docDesignacion,
        inicio: params.inicio,
        fin: params.fin,
        orgAreaId: params.area_id,
        plaza: params.plaza,
        modalidad: params.modalidad,
        tipo: params.tipo,
        trabajadorId: params.trabajadorId,
        estado: params.estado);
  }
}
