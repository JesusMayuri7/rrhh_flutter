import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../../core/errors/failure.dart';
import 'import_file_use_case.dart';

abstract class IImportFileRepository {
  Future<Either<Failure, ResponseEntity>> importFile(
    ParamsInportFile params,
  );
}
