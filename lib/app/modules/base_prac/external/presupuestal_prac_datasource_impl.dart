import 'dart:io';

import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../data/i_certificado_prac_datasource.dart';
import '../data/i_presupuestal_prac_datasource.dart';

class PresupuestalPracDatasourceImpl implements IPresupuestalPracDatasource {
  final ICertificadoPracDatasource getCertificadosPracImpl;
  //final IPimCasDatasource getPimCasImpl;
  PresupuestalPracDatasourceImpl({
    required this.getCertificadosPracImpl,
    //required this.getPimCasImpl,
  });

  @override
  Future<List<ResponseModel>> getPresupuestalPrac(String anio) async {
    try {
      var responseCertificado =
          this.getCertificadosPracImpl.getCertificadoPrac(anio);
      //var responsePim = this.getPimCasImpl.getPimCas(anio);

      List<ResponseModel> listData =
          await Future.wait([ responseCertificado]);
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