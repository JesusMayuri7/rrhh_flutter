import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasources/i_initial_cas_datasource.dart';

class InitialCasDatasourceImpl implements IInitialCasDatasource {
  var url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/presupuestal/variables', {'q': '{http}'});

  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  InitialCasDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> initial(
      {required String dscVariable,
      required int modalidadId,
      required String anio}) async {
    Map<String, dynamic> params = {
      "dscVariable": dscVariable,
      "modalidadId": modalidadId,
      "anio": anio
    };

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          json.encode(params), (i) => responseFromJson(i));

      return response;
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
