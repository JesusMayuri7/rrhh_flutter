import 'dart:io';

import 'package:rrhh_clean/app/modules/airhsp/data/models/airhsp_presupuesto_model.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_codigo_use_case.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasources/i_airhsp_codigos_datasource.dart';
import '../data/models/airhsp_codigo_model.dart';

class AirhspCodigoDataSourceImpl implements IAirhspCodigoDatasource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  AirhspCodigoDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> listar(ParamsCodigo paramsCodigo) async {
    var url =
        Uri.http('rrhh.pvn.gob.pe', '/api/airhsp/codigos_air', {'q': '{http}'});
    
    try {
      ResponseModel response = await this.httpCustom.request('GET', url.toString(), {}, (i) => responseFromJson(i));

      final List<AirhspCodigoModel> result =airhspCodigoModelFromJson(response.data);      
            
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
