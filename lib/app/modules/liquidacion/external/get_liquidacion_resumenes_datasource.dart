import 'dart:io';

import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_liquidacion_resumen_siaf_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_liquidacion_resumen_liquidacion_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_liquidacion_resumenes_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/params_liquidacion_resumen.dart';

import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetLiquidacionResumenesDatasourceImpl
    implements IGetLiquidacionResumenesDatasource {
  IGetLiquidacionResumenLiquidacionDatasource
      getLiquidacionResumenLiquidacionDatasource;
  IGetLiquidacionResumenSiafDatasource getLiquidacionResumenSiafDatasource;

  GetLiquidacionResumenesDatasourceImpl({
    required this.getLiquidacionResumenLiquidacionDatasource,
    required this.getLiquidacionResumenSiafDatasource,
  });

  @override
  Future<List<ResponseModel>> getListLiquidacionResumenes(
      ParamsLiquidacionResumen paramsResumen) async {
    try {
      var responseResumenLiquidacion = this
          .getLiquidacionResumenLiquidacionDatasource
          .getListLiquidacionResumenLiquidacion(paramsResumen);

      var responseResumenSiaf = this
          .getLiquidacionResumenSiafDatasource
          .getListLiquidacionResumenSiaf(paramsResumen);

      List<ResponseModel> listData =
          await Future.wait([responseResumenLiquidacion, responseResumenSiaf]);
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
