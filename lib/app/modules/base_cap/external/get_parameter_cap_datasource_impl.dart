import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasource/i_parameter_cap_datasoruce.dart';
import '../data/models/parameter_cap_model.dart';

class GetParameterCapDatasourceImpl implements IParameterCapDataSoruce {
  final IClientCustom httpCustom;
  GetParameterCapDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getParameters(String anio) async {
    var url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/presupuestal/variables', {'q': '{http}'});

    final parameter = {
      "dscVariable": "CALCULAR_PROYECCION_CAP",
      "modalidadId": 3,
      "anio": anio
    };

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          json.encode(parameter), (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<ParameterCapModel> parameters = parameterCapModelFromJson(bodyData);

      return ResponseModel(
          data: parameters, status: response.status, message: response.message);
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
