import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/i_prac_repository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class UpdatedPracUseCase implements UseCase<ResponseModel, UpdatedPracParams> {
  final IPracRepository iPracRepository;

  UpdatedPracUseCase({
    required this.iPracRepository,
  });

  @override
  Future<Either<Failure, ResponseModel>> call(UpdatedPracParams params) async {
    return await iPracRepository.updatedPrac(params);
  }
}

class UpdatedPracParams {
  int practicanteId;
  String campo;
  dynamic valor;
  UpdatedPracParams({
    required this.practicanteId,
    required this.campo,
    required this.valor,
  });

  Map<String, dynamic> toMap() {
    return {
      'practicanteId': practicanteId,
      'campo': campo,
      'valor': valor,
    };
  }

  factory UpdatedPracParams.fromMap(Map<String, dynamic> map) {
    return UpdatedPracParams(
      practicanteId: map['practicanteId'],
      campo: map['campo'],
      valor: map['valor'],
    );
  }

  String toJson() => json.encode(toMap());
}
