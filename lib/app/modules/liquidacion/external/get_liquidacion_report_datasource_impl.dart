import 'dart:io';
import 'dart:convert';

import 'package:rrhh_clean/app/modules/liquidacion/data/datasource/i_get_liquidacion_report_datasource.dart';
import 'package:rrhh_clean/app/modules/liquidacion/data/models/liquidacion_report_model.dart';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetLiquidacionReportDatasourceImpl
    implements IGetLiquidacionReportDatasource {
  final IClientCustom httpCustom;

  GetLiquidacionReportDatasourceImpl({required this.httpCustom});

  @override
  Future<ResponseModel> getLiquidacionReport(String _anio) async {
    Uri url = Uri.http('rrhh.pvn.gob.pe',
        '/api/liquidacion/report_siaf_all/' + _anio, {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<LiquidacionReportModel> result =
          liquidacionReportEntityFromJson(bodyData);
      return ResponseModel(
          status: response.status, message: response.message, data: result);
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
