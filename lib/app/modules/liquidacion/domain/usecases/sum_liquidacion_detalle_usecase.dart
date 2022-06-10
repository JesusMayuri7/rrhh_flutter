import 'package:dartz/dartz.dart';
import '../entities/liquidacion_detalle._entity.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/domain/use_cases/usecase.dart';

class SumLiquidacionDetalleUseCase
    implements
        UseCase<List<LiquidacionDetalleEntity>,
            List<LiquidacionDetalleEntity>> {
  SumLiquidacionDetalleUseCase();

  @override
  Future<Either<Failure, List<LiquidacionDetalleEntity>>> call(
      List<LiquidacionDetalleEntity> params) async {
    double totalCertificado = 0;
    double totalDevengado = 0;
    double totalLiquidacion = 0;
    double totalDevolucion = 0;

    if (params.length > 0) {
      if (params.last.id == 0) params.removeLast();

      for (var item in params) {
        totalCertificado += item.montoCertificado;
        totalDevengado += item.montoDevengado;
        totalLiquidacion += item.montoLiquidacion;
        totalDevolucion += item.montoDevolucion;
      }
      params.add(LiquidacionDetalleEntity(
          clasificador: '',
          montoDevengado: totalDevengado,
          montoDevolucion: totalDevolucion,
          montoCertificado: totalCertificado,
          montoLiquidacion: totalLiquidacion,
          id: 0));
    }
    return Future.value(Right(params));
  }
}
