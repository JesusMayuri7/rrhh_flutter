import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import '../../entities/modalidad_entity.dart';
import '../../entities/result_entity.dart';

import '../../repositories/i_certificados_repository.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/domain/use_cases/usecase.dart';

class SaveCertificadoUseCase implements UseCase<ResponseEntity, ParamsSave> {
  final ICertificadosRepository repository;

  SaveCertificadoUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseEntity>> call(ParamsSave params) async {
    print('usecase ' + params.toString());
    final result = await repository.saveCertificado(
        detalle: params.detalle,
        tipo: params.tipo,
        certificado: params.certificado,
        montoCertificado: params.montoCertificado,
        anio: params.anio,
        modalidadId: params.modalidad.id,
        clasificadorConcepto: params.clasificadorConcepto);
    return result;
  }
}

class ParamsSave extends Equatable {
  final String detalle;
  final String tipo;
  final String certificado;
  final double montoCertificado;
  final String anio;
  final ModalidadEntity modalidad;
  final List<Map<String, dynamic>> clasificadorConcepto;
  ParamsSave(
      {required this.detalle,
      required this.tipo,
      required this.certificado,
      required this.montoCertificado,
      required this.anio,
      required this.clasificadorConcepto,
      required this.modalidad});

  @override
  List<Object?> get props => [
        certificado,
        montoCertificado,
        anio,
        modalidad,
        clasificadorConcepto,
        tipo,
        detalle
      ];
}
