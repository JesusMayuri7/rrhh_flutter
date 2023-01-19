import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_clasificador_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/clasificador_model.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetClasificadoresImpl implements IClasificadorDatasourceApp {
  final IClientCustom httpCustom;
  GetClasificadoresImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> getClasificadores(String anio) async {
    Uri url =
        Uri.http('rrhh.pvn.gob.pe', 'api/presupuesto/clasificador/' + anio);

    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String clasificadorString = jsonEncode(response.data);

      List<ClasificadorEntity> clasificadores =
          clasificadorFromJson(clasificadorString);

      return ResponseModel(
          status: response.status,
          message: response.message,
          data: clasificadores);
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
