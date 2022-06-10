import 'dart:io';
import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:rrhh_clean/app/bloc/app_bloc.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';

import 'package:rrhh_clean/app/modules/subsidio/data/i_subsidio_devolucion_datasource.dart';
import 'package:rrhh_clean/app/modules/subsidio/data/subsidio_devolucion_model.dart';
import 'package:rrhh_clean/core/config/http_custom.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

class GetSubsidioDevolucionDatasourceImpl
    implements IGetSubsidioDevolucionDatasource {
  final appBloc = Modular.get<AuthBloc>();

  final IClientCustom clientCustom;

  GetSubsidioDevolucionDatasourceImpl({required this.clientCustom});

  @override
  Future<ResponseModel> getSubsidioDevolucion(String anio) async {
    //final String token = (appBloc.state as SuccessAuthState).loginResponseEntity.token;

    // int _anio = int.parse((appBloc.state as AppAnioSelectedState).anioSelected);

    Uri url = Uri.http(
        'rrhh.pvn.gob.pe', '/api/subsidio/devolucion/' + anio, {'q': '{http}'});

    try {
      ResponseModel response = await clientCustom.request(
          'GET', url.toString(), {}, (j) => responseFromJson(j));

      String bodyData = jsonEncode(response.data);

      List<SubsidioDevolucionModel> result =
          subsidioDevolucionModelFromJson(bodyData);

      return ResponseModel(
          status: response.status, message: response.message, data: result);
    } on SocketException {
      throw ServerException('Sin Conexion');
    } on HttpException {
      throw ServerException('Error de Servidor');
    } on FormatException {
      throw ServerException('Error de formato');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
