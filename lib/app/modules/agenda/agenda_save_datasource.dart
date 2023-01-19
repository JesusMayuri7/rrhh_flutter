// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/agenda/agenda_model.dart';
import 'package:rrhh_clean/app/modules/agenda/cubit/agenda_params.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

abstract class IAgendaSaveDatasource {
  Future<ResponseModel> saveAgenda(AgendaParams agendaParams);
}

class AgendaSaveDatasourceImpl implements IAgendaSaveDatasource {
  final IClientCustom httpCustom;
  AgendaSaveDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> saveAgenda(AgendaParams agendaParams) async {
    var url = Uri.http('rrhh.pvn.gob.pe', '/api/todo', {'q': '{http}'});

    try {
      ResponseModel response = await httpCustom.request('POST', url.toString(),
          agendaParams.toMap(), (i) => responseFromJson(i));

      print('data : ' + response.data.toString());
      String bodyData = jsonEncode(response.data);

      AgendaModel result = AgendaModel.fromJson(response.data);

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
