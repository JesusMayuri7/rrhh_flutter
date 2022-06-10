import 'dart:io';

import 'package:rrhh_clean/app/modules/base_cap/data/datasource/i_presupuesto_cap_datasource.dart';
import 'package:rrhh_clean/app/modules/base_cap/external/get_certificado_cap_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/base_cap/external/get_pim_cap_datasource_impl.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetPresupuestoCapDatasourceImpl implements IPresupuestoCapDatasource {
  final GetCertificadoCapDatasourceImpl getCertificadoCapDatasourceImpl;
  final GetPimCapDatasourceImpl getPimCapDatasourceImpl;

  GetPresupuestoCapDatasourceImpl({
    required this.getCertificadoCapDatasourceImpl,
    required this.getPimCapDatasourceImpl,
  });

  @override
  Future<List<ResponseModel>> getPresupuestoCap(String anio) async {
    try {
      var responseCertificado =
          this.getCertificadoCapDatasourceImpl.getCertificadoCap(anio);
      print(' paso certifica');
      var responsePim = this.getPimCapDatasourceImpl.getPimCap(anio);
      print(' paso pim');
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
