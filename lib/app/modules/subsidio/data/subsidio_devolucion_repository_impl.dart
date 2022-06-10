import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/subsidio/data/i_get_data_initial_datasource.dart';
import 'package:rrhh_clean/app/modules/subsidio/data/i_new_subsidio_devolucion_datasource.dart';
import 'package:rrhh_clean/app/modules/subsidio/data/i_subsidio_devolucion_datasource.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/i_subsidio_repository.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/update_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class SubsidioDevolucionRepositoryImpl implements ISubsidioRepository {
  final IGetSubsidioDevolucionDatasource getSubsidioDevolucionDatasource;
  final IGetDataInitialDatasource getDataInitialDatasource;
  final INewSubsidioDevolucionDatasource newSubsidioDevolucionDatasource;

  SubsidioDevolucionRepositoryImpl({
    required this.getSubsidioDevolucionDatasource,
    required this.getDataInitialDatasource,
    required this.newSubsidioDevolucionDatasource,
  });
  @override
  Future<Either<Failure, ResponseModel>> getSubsidioDevolucion(
      String anio) async {
    try {
      final result = await this
          .getSubsidioDevolucionDatasource
          .getSubsidioDevolucion(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseModel>>> getDataInitial(
      String anio) async {
    try {
      final result = await this.getDataInitialDatasource.getDataInitial(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, SubsidioDevolucionEntity>> updateSubsidioDevolucion(
      ParamsUpdateSubsidio params) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SubsidioDevolucionEntity>> newSubsidioDevolucion(
      ParamsNewSubsidio params) async {
    try {
      final result = await this
          .newSubsidioDevolucionDatasource
          .newSubsidioDevolucion(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
