import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/domain/entities/response_entity.dart';
import '../datasources/i_get_list_certificados.dart';
import '../datasources/i_save_certificado_datasource.dart';
import '../datasources/i_validar_datasource.dart';
import '../datasources/i_modalidad_concepto_clasificador_datasource.dart';
import '../../domain/entities/modalidad_concepto_clasificador_entity.dart';
import '../../domain/entities/result_entity.dart';
import '../../domain/repositories/i_certificados_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';

class CertificadosRepositoryImpl implements ICertificadosRepository {
  final IValidarDatasource certificadosDaatasource;
  final IModalidadConceptoClasificadorDatasource modalidadConceptoDaatasource;
  final ISaveCertificadoDatasource saveCertificadoDatasource;
  final IGetListCertificadosDatasource getListCertificadosDatasource;

  //ListarRepositoryImpl(this.datasource);
  CertificadosRepositoryImpl(
      this.certificadosDaatasource,
      this.modalidadConceptoDaatasource,
      this.saveCertificadoDatasource,
      this.getListCertificadosDatasource);

  @override
  Future<Either<Failure, ResponseEntity>> validarCertificado(
      {required String certificado, required String anio}) async {
    ResponseEntity result;
    try {
      result = await this
          .certificadosDaatasource
          .validarCertificado(certiificado: certificado, anio: anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ModalidadConceptoClasificadorEntity>>
      modalidadConceptoClasificador() async {
    print('entro al repositorio getModaldiadConceptoClasificador');
    try {
      final result = await this
          .modalidadConceptoDaatasource
          .modalidadConceptoClasificador();

      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getListCertificados() async {
    try {
      final result =
          await this.getListCertificadosDatasource.getListCertificados();

      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> saveCertificado(
      {required String detalle,
      required String tipo,
      required String certificado,
      required String anio,
      required double montoCertificado,
      required int modalidadId,
      required List<Map<String, dynamic>> clasificadorConcepto}) async {
    print('resposity ' + clasificadorConcepto.toString());
    try {
      final result = await this.saveCertificadoDatasource.saveCertificado(
          detalle: detalle,
          tipo: tipo,
          certiificado: certificado,
          anio: anio,
          montoCertificado: montoCertificado,
          modalidadId: modalidadId,
          conceptoClasificador: clasificadorConcepto);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
