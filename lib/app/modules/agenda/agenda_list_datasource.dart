// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/agenda/agenda_model.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

abstract class IAgendaListDatasource {
  Future<ResponseModel> listarAgenda();
}

class AgendaListDatasourceImpl implements IAgendaListDatasource {
  final IClientCustom httpCustom;
  AgendaListDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> listarAgenda() async {
    var url = Uri.http('rrhh.pvn.gob.pe', '/api/todo_anio', {'q': '{http}'});
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      String bodyData = jsonEncode(response.data);

      List<AgendaModel> result = agendaModelFromJson(bodyData);

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

  @override
  Future<ResponseModel> saveAgenda() {
    // TODO: implement saveAgenda
    throw UnimplementedError();
  }
}
