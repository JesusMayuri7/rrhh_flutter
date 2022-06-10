import 'dart:io';

import 'package:rrhh_clean/app/modules/subsidio/data/i_get_data_initial_datasource.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/external/get_certificados_impl.dart';
import 'package:rrhh_clean/core/external/get_clasificadores_impl.dart';
import 'package:rrhh_clean/core/external/get_fuentes_impl.dart';
import 'package:rrhh_clean/core/external/get_metas_impl.dart';

class GetDataInitialDatasourceImpl implements IGetDataInitialDatasource {
  final GetCertificadosImpl getCertificadosImpl;
  final GetMetasImpl getMetasImpl;
  final GetClasificadoresImpl getClasificadoresImpl;
  final GetFuentesImpl getFuentesImpl;

  GetDataInitialDatasourceImpl(
      {required this.getCertificadosImpl,
      required this.getMetasImpl,
      required this.getClasificadoresImpl,
      required this.getFuentesImpl});

  @override
  Future<List<ResponseModel>> getDataInitial(String anio) async {
    try {
      var responseCertificados = this.getCertificadosImpl.getCertificados(anio);
      var responseMetas = this.getMetasImpl.getMetas(anio);
      var responseFuentes = this.getFuentesImpl.getFuentes(anio);
      var responseClasificadores =
          this.getClasificadoresImpl.getClasificadores(anio);

      List<ResponseModel> listData = await Future.wait([
        responseMetas,
        responseCertificados,
        responseClasificadores,
        responseFuentes
      ]);

      return listData;
    } on SocketException {
      throw ServerException('Sin Conexion');
    } on HttpException {
      throw ServerException('Error de Servidor');
    } on FormatException {
      throw ServerException('Error de formato');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
