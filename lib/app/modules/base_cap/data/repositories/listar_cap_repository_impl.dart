import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/i_base_cap_repository.dart';
import '../datasource/i_list_cap_datasoruce.dart';
import '../datasource/i_parameter_cap_datasoruce.dart';
import '../datasource/i_presupuesto_cap_datasource.dart';

class BaseCapRepositoryImpl implements IBaseCapRepository {
  final IListCapDataSoruce iListCapDataSoruce;
  final IParameterCapDataSoruce iParameterCapDataSoruce;
  final IPresupuestoCapDatasource iPresupuestoCapDatasource;

  BaseCapRepositoryImpl({
    required this.iListCapDataSoruce,
    required this.iParameterCapDataSoruce,
    required this.iPresupuestoCapDatasource,
  });

  @override
  Future<Either<Failure, ResponseEntity>> getListBaseCap(String anio) async {
    try {
      final response = await this.iListCapDataSoruce.listar(anio);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getParameterBaseCap(
      String anio) async {
    try {
      final response = await this.iParameterCapDataSoruce.getParameters(anio);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseEntity>>> getPresupuestoBaseCap(
      String anio) async {
    try {
      final response =
          await this.iPresupuestoCapDatasource.getPresupuestoCap(anio);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
