import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasources/i_pim_cas_datasource.dart';
import '../data/model/presupuesto_cas_model.dart';

class PimCasDatasourceImpl implements IPimCasDatasource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  PimCasDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getPimCas(String anio) async {
    var url = Uri.http('rrhh.pvn.gob.pe',
        '/api/presupuestal/presupuesto_cas/' + anio, {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      return ResponseModel(
          status: true,
          message: 'Pim',
          data: presupuestoCasEntityFromJson(bodyData));
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
