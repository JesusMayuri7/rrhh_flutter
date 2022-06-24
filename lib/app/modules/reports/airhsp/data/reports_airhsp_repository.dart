import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/reports/airhsp/data/i_get_download_datasource.dart';
import 'package:rrhh_clean/app/modules/reports/airhsp/domain/i_reporst_airhsp_repository.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class ReportsAirhspRepositoryImpl implements IReportsAirhspRepository {
  final IGetDownloadDatasource iGetDownloadDatasource;
  ReportsAirhspRepositoryImpl({
    required this.iGetDownloadDatasource,
  });

  @override
  Future<Either<Failure, dynamic>> getDownloadAirhsp() async {
    try {
      final result = await this.iGetDownloadDatasource.getDownloadDatasource();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
