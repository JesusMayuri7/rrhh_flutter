import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/airhsp/data/datasources/i_download_file_datasource.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/i_airhsp_respository.dart';
import '../datasources/i_listar_datasource.dart';
import '../models/airhsp_model.dart';
import '../models/conceptos_model.dart';

class ListarRepositoryImpl implements IAirhspRepository {
  final IListarAirhspDatasource datasource;
  final IDownloadFileDatasource iDownloadFileDatasource;

  ListarRepositoryImpl({
    required this.datasource,
    required this.iDownloadFileDatasource,
  });

  @override
  Future<Either<Failure, List<AirHspModel>>> listar(
      ejecutora, tipoPersona) async {
    List<AirHspModel> list;
    try {
      list = await datasource.listar(ejecutora, tipoPersona);
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ConceptoModel>>> conceptos(
      ejecutora, tipoPersona, codPlaza) async {
    List<ConceptoModel> list;
    try {
      list = await datasource.conceptos(ejecutora, tipoPersona, codPlaza);
      return Right(list);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> downloadFile(
      String tipoPersona) async {
    try {
      var result = await iDownloadFileDatasource.downloadFile(tipoPersona);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
