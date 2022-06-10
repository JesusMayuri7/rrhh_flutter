import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';

import '../../../../../core/domain/use_cases/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../repository/i_liquidacion_repository.dart';

class AddLiquidacionUseCase
    implements UseCase<ResponseEntity, ParamsAddLiquidacion> {
  final ILiquidacionRepository repositoryLiquidacion;

  AddLiquidacionUseCase({required this.repositoryLiquidacion});

  @override
  Future<Either<Failure, ResponseEntity>> call(
      ParamsAddLiquidacion paramsAddLiquidacion) async {
    return await repositoryLiquidacion.addLiquidacion(paramsAddLiquidacion);
  }
}

class ParamsAddLiquidacion {
  int modalidadId;
  String anio;
  String dscCertificado;
  int fuenteId;
  int metaId;
  String codigoPlaza;
  String codigoSiga;
  String dni;
  String nombres;
  String expediente;
  List<LiquidacionDetalleEntity> liquidacionDetalle;

  ParamsAddLiquidacion({
    required this.modalidadId,
    required this.anio,
    required this.dscCertificado,
    required this.fuenteId,
    required this.metaId,
    required this.codigoPlaza,
    required this.codigoSiga,
    required this.dni,
    required this.nombres,
    required this.expediente,
    required this.liquidacionDetalle,
    //required this.liquidacionEntity,
  });

  @override
  String toString() {
    return 'ParamsAddLiquidacion(modalidadId: $modalidadId, anio: $anio, dscCertificado: $dscCertificado, fuenteId: $fuenteId, metaId: $metaId, codigoPlaza: $codigoPlaza, codigoSiga: $codigoSiga, dni: $dni, nombres: $nombres, expediente: $expediente, liquidacionDetalle: $liquidacionDetalle)';
  }

  Map<String, dynamic> toMap() {
    return {
      'modalidadId': modalidadId,
      'anio': anio,
      'dscCertificado': dscCertificado,
      'fuenteId': fuenteId,
      'metaId': metaId,
      'codigoPlaza': codigoPlaza,
      'codigoSiga': codigoSiga,
      'dni': dni,
      'nombres': nombres,
      'expediente': expediente,
      'liquidacionDetalle': liquidacionDetalle.map((x) => x.toMap()).toList(),
    };
  }
}
