import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/params_liquidacion_resumen.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/add_liquidacion_usecase.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/update_liquidacion_detalle.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/update_liquidacion_usecase.dart';

import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

abstract class ILiquidacionRepository {
  Future<Either<Failure, ResponseEntity>> getListLiquidacion(String anio);

  Future<Either<Failure, ResponseEntity>> getListLiquidacionResumenSiaf(
      ParamsLiquidacionResumen paramsResumen);

  Future<Either<Failure, List<ResponseEntity>>> getListLiquidacionResumenes(
      ParamsLiquidacionResumen paramsResumen);

  Future<Either<Failure, Map<String, dynamic>>> updateLiquidacionDetalle(
      ParamsUpdateLiquidacionDetalle paramsUupdate);
  Future<Either<Failure, Map<String, dynamic>>> updateLiquidacion(
      ParamsUpdateLiquidacion paramsUupdate);

  Future<Either<Failure, ResponseEntity>> addLiquidacion(
      ParamsAddLiquidacion params);

  Future<Either<Failure, List<ResponseEntity>>> getDataInitial(String anio);
  Future<Either<Failure, ResponseEntity>> getLiquidacionReport(String anio);
}
