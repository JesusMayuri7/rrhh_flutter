import 'dart:io';

import 'package:rrhh_clean/app/modules/base_cas/data/datasources/i_presupuesto_cas_datasource.dart';

import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../data/datasources/i_pim_cas_datasource.dart';


class PresupuestoCasDatasourceImplLey implements IPresupuestoCasDatasource {
  final IPimCasDatasource getCertificadosCasImpl;
  final IPimCasDatasource getPimCasImpl;
  PresupuestoCasDatasourceImplLey({
    required this.getCertificadosCasImpl,
    required this.getPimCasImpl,
  });

  @override
  Future<List<ResponseModel>> getPresupuestoCas(String anio) async {
    try {
      var responseCertificado = this.getCertificadosCasImpl.getPimCas(anio);
      var responsePim = this.getPimCasImpl.getPimCas(anio);

      List<ResponseModel> listData =
          await Future.wait([responsePim, responseCertificado]);
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
