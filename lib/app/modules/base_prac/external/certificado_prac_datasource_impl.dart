import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/presupuesto_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/i_certificado_prac_datasource.dart';

class CertificadoPracDatasourceImpl implements ICertificadoPracDatasource {
  
  final IClientCustom httpCustom;
  CertificadoPracDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getCertificadoPrac(String anio) async {
    var url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/formativa/certificado/' + anio, {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      var bodyData = jsonEncode(response.data);

      print('presupuesto model 0');
      print(response.data);
      final List<PresupuestoModel> presupuestoModel = presupuestoEntityFromJson(bodyData);

      print('presupuesto model 1');
      print('list certificados '+presupuestoModel.length.toString());

      return ResponseModel(
          status: response.status,
          message: response.message,
          data: presupuestoModel);
    } on SocketException {
      throw ServerException('Sin conexion');
    } on HttpException {
      throw ServerException("No se encuentra la plaza");
    } on FormatException {
      throw ServerException("Formato incorrecto");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
