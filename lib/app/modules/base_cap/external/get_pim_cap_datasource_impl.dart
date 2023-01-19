import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/presupuesto_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasource/i_pim_cap_datasource.dart';

class GetPimCapDatasourceImpl implements IPimCapDatasource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  GetPimCapDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getPimCap(String anio) async {
    var url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/cap/presupuesto/' + anio, {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);
      return ResponseModel(
          status: true,
          message: 'Presupuesto CAP',
          data: presupuestoEntityFromJson(bodyData));
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
