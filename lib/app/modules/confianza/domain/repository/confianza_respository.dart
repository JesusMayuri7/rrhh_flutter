import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/response_entity.dart';
import '../../../../../core/errors/failure.dart';

abstract class IConfianzaRepository {
  Future<Either<Failure, ResponseEntity>> getListConfianza(String anio);
  Future<Either<Failure, ResponseEntity>> getListAreas();
  Future<Either<Failure, ResponseEntity>> postConfianza(
      {
      required int id,
      required String anio,
      required String cargo,
      required String detalle,
      required String direccion,
      required String dni,
      required String docCese,
      required String docDesignacion,
      required String fin,
      required String inicio,
      required String modalidad,
      required String nombres,
      required int orgAreaId,
      required String plaza,
      required String tipo,
      required int trabajadorId,
      required String estado});
}
