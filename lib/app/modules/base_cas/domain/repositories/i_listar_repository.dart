import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import '../entities/base_cas_entity.dart';
import '../entities/cas_excel_entity.dart';
import '../../../../../core/errors/failure.dart';

abstract class IListarRepository {
  Future<Either<Failure, List<BaseCasEntity>>> listarBaseCas(String anio);
  Future<Either<Failure, List<CasExcelEntity>>> listarBaseExcel();
  Future<Either<Failure, ResponseEntity>> getPimCasRepository(String anio);
  Future<Either<Failure, List<ResponseEntity>>> getPresupuestoRepository(
      String anio);
  Future<Either<Failure, ResponseEntity>> getCerticadoCasRepository(
      String anio);
  Future<Either<Failure, ResponseEntity>> initialBaseCas(
      {required String dscVariable,
      required int modalidadId,
      required String anio});
}
