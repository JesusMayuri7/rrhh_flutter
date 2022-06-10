import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/base_prac/data/i_updated_prac_datasource.dart';
import 'package:rrhh_clean/app/modules/base_prac/data/practicante_model.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/updated_prac_use_case.dart';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';

class UpdatedPracDataSourceImpl implements IUpdatedPracDataSource {
  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  UpdatedPracDataSourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> updatedPrac(UpdatedPracParams params) async {
    var url =
        Uri.http('rrhh.pvn.gob.pe', '/api/formativa/base_formativa_updated');

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          json.encode(params.toMap()), (i) => responseFromJson(i));

      PracticanteModel practicanteModel =
          PracticanteModel.fromJson(response.data);
      print(response);
      return ResponseModel(
          data: practicanteModel,
          status: response.status,
          message: response.message);
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
