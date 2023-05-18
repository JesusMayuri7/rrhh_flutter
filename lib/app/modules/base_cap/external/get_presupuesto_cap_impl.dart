import 'dart:io';

import 'package:rrhh_clean/app/modules/base_cap/data/datasource/i_presupuesto_cap_datasource.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../data/datasource/i_certificado_cap_datasource.dart';
import '../data/datasource/i_pim_cap_datasource.dart';

class GetPresupuestoCapDatasourceImpl implements IPresupuestoCapDatasource {
  final ICertificadoCapDatasource getCertificadoCapDatasourceImpl;
  final IPimCapDatasource getPimCapDatasourceImpl;

  GetPresupuestoCapDatasourceImpl({
    required this.getCertificadoCapDatasourceImpl,
    required this.getPimCapDatasourceImpl,
  });

  @override
  Future<List<ResponseModel>> getPresupuestoCap(String anio) async {
    try {
      var responseCertificado =
          this.getCertificadoCapDatasourceImpl.getCertificadoCap(anio);

      var responsePim = this.getPimCapDatasourceImpl.getPimCap(anio);

      List<ResponseModel> listData =
          await Future.wait([responseCertificado, responsePim]);
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
