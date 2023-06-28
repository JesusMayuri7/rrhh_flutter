import 'dart:io';

import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasources/airhsp_ext_datasource.dart';
import '../data/models/airhsp_ext_presupuesto_model.dart';

class AirhspExtDataSourceImpl implements IAirhspExtDatasource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  AirhspExtDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> listar(String anio) async {
    var url =
        Uri.http('localhost:3000', '/import-airhsp/airhsp', {'q': '{http}'});
    
    try {
      ResponseModel response = await this
          .httpCustom
          .request('GET', url.toString(), {}, (i) => responseFromJson(i));
      
      //String bodyData = jsonEncode(response.data);
      final List<AirhspExtModel> result =
          airhspExtModelFromJson(response.data);      
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