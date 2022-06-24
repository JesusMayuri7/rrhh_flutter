import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

abstract class IReportsAirhspRepository {
  Future<Either<Failure, dynamic>> getDownloadAirhsp();
}
