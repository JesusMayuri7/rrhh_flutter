import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/base_cas/data/datasources/i_certificado_cas_datasource.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../datasources/i_base_cas_datasource.dart';
import '../datasources/i_base_excel_datasource.dart';
import '../datasources/i_initial_cas_datasource.dart';
import '../datasources/i_pim_cas_datasource.dart';
import '../../domain/entities/base_cas_entity.dart';
import '../../domain/entities/cas_excel_entity.dart';
import '../../domain/repositories/i_listar_repository.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../datasources/i_presupuesto_cas_datasource.dart';

class ListarRepositoryImpl implements IListarRepository {
  final IBaseExcelDatasource baseExceldatasource;
  final IBaseCasDatasource baseCasdatasource;
  final IInitialCasDatasource initialCasdatasource;
  final IPimCasDatasource pimCasDatasource;
  final ICertificadoCasDatasource certificadoCasDatasource;
  final IPresupuestoCasDatasource presupuestoCasDatasource;

  //ListarRepositoryImpl(this.datasource);
  ListarRepositoryImpl(
      {required this.baseExceldatasource,
      required this.baseCasdatasource,
      required this.initialCasdatasource,
      required this.pimCasDatasource,
      required this.certificadoCasDatasource,
      required this.presupuestoCasDatasource});

  @override
  Future<Either<Failure, List<CasExcelEntity>>> listarBaseExcel() async {
    List<CasExcelEntity> list;
    try {
      list = await baseExceldatasource.listar();
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<BaseCasEntity>>> listarBaseCas(
      String anio) async {
    //List<BaseCasEntity> list;
    try {
      final list = await baseCasdatasource.listar(anio);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> initialBaseCas(
      {required String dscVariable,
      required int modalidadId,
      required String anio}) async {
    try {
      final list = await initialCasdatasource.initial(
          dscVariable: dscVariable, modalidadId: modalidadId, anio: anio);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getPimCasRepository(
      String anio) async {
    try {
      final list = await pimCasDatasource.getPimCas(anio);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getCerticadoCasRepository(
      String anio) async {
    try {
      final list = await certificadoCasDatasource.getCertificadoCas(anio);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResponseEntity>>> getPresupuestoRepository(
      String anio) async {
    try {
      final list = await presupuestoCasDatasource.getPresupuestoCas(anio);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
