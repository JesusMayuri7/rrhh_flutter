import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/i_requerimiento_repository.dart';
import 'package:rrhh_clean/core/errors/failure.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_list_usecase.dart';

class RequerimientoRepositoryImpl implements IRequerimientoRepository {
  @override
  Future<Either<Failure, ResponseEntity>> getListRequerimientos(
      ParamsRequerimiento params) {
    // TODO: implement getListRequerimientos
    throw UnimplementedError();
  }
}
