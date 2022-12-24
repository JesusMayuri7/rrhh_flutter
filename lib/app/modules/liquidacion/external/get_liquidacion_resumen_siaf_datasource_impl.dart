import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_liquidacion_resumen_siaf_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/params_liquidacion_resumen.dart';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../data/models/liquidacion_resumen_model.dart';
import '../../../../core/errors/exceptions.dart';

class GetLiquidacionResumenSiafDatasourceImpl
    implements IGetLiquidacionResumenSiafDatasource {
  Uri url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/liquidacion/resumen_siaf', {'q': 'http'});

  final IClientCustom httpCustom;

  GetLiquidacionResumenSiafDatasourceImpl({required this.httpCustom});

  @override
  Future<ResponseModel> getListLiquidacionResumenSiaf(
      ParamsLiquidacionResumen paramsLiquidacionResumen) async {
    Map<String, String> params = {
      "dscClasificador": paramsLiquidacionResumen.dscClasificador,
      "dscCertificado": paramsLiquidacionResumen.dscCertificado,
      "anio": paramsLiquidacionResumen.anio
    };

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          jsonEncode(params), (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<LiquidacionResumenModel> liquidacionModel =
          liquidacionResumenModelFromJson(bodyData);

      return ResponseModel(
          status: response.status,
          message: response.message,
          data: liquidacionModel);
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
