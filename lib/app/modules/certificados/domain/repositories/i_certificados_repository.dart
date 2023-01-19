import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import '../entities/modalidad_concepto_clasificador_entity.dart';
import '../../../../../core/errors/failure.dart';

abstract class ICertificadosRepository {
  Future<Either<Failure, ResponseEntity>> validarCertificado({
    required String certificado,
    required String anio,
  });

  Future<Either<Failure, ModalidadConceptoClasificadorEntity>>
      modalidadConceptoClasificador();

  Future<Either<Failure, ResponseEntity>> saveCertificado(
      {required String detalle,
      required String tipo,
      required String certificado,
      required String anio,
      required double montoCertificado,
      required int modalidadId,
      required List<Map<String, dynamic>> clasificadorConcepto});

  Future<Either<Failure, ResponseEntity>> getListCertificados(String anio);
}
