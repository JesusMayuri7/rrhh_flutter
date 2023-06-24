import 'dart:io';

import 'package:rrhh_clean/app/modules/airhsp/data/datasources/i_airhsp_presupuesto_datasource.dart';
import 'package:rrhh_clean/app/modules/airhsp/data/models/airhsp_presupuesto_model.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';

class AirhspPresupuestoDataSourceImpl implements IAirhspPresupuestoDatasource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  AirhspPresupuestoDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> listar(String anio) async {
    var url =
        Uri.http('rrhh.pvn.gob.pe', '/api/activos/airhsp/', {'q': '{http}'});
    
    try {
      ResponseModel response = await this
          .httpCustom
          .request('GET', url.toString(), {}, (i) => responseFromJson(i));

      //String bodyData = jsonEncode(response.data);
      final List<AirhspPresupuestoModel> result =
          airhspPresupuestoModelFromJson(response.data);      
      return ResponseModel(
          data: result, status: response.status, message: response.message);
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
