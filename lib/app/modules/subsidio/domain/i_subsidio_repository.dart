import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/update_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

abstract class ISubsidioRepository {
  Future<Either<Failure, ResponseModel>> getSubsidioDevolucion(String anio);
  Future<Either<Failure, SubsidioDevolucionEntity>> updateSubsidioDevolucion(
      ParamsUpdateSubsidio params);
  Future<Either<Failure, SubsidioDevolucionEntity>> newSubsidioDevolucion(
      ParamsNewSubsidio params);
  Future<Either<Failure, List<ResponseModel>>> getDataInitial(String anio);
}
