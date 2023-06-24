import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import '../entities/airhsp_presupuesto_entity.dart';

class CalcularAirhspUseCase implements UseCase<List<AirhspPresupuestoEntity>, List<AirhspPresupuestoEntity>> {
  CalcularAirhspUseCase();

  @override
  Future<Either<Failure, List<AirhspPresupuestoEntity>>> call(List<AirhspPresupuestoEntity> params) async {

    List<AirhspPresupuestoEntity> result = List<AirhspPresupuestoEntity>.from(params.map((AirhspPresupuestoEntity e) { 
          
      return e.calcular(); 
      
      }).toList());
     return Future.value(Right(result));

  }
}