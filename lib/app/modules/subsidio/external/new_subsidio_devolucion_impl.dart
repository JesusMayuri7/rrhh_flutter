import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/app/modules/subsidio/data/i_new_subsidio_devolucion_datasource.dart';
import 'package:rrhh_clean/app/modules/subsidio/data/subsidio_devolucion_model.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import 'package:rrhh_clean/core/errors/exceptions.dart';

class NewSubsidioDevolucionDatasourceImpl
    implements INewSubsidioDevolucionDatasource {
  final IClientCustom clientCustom;

  NewSubsidioDevolucionDatasourceImpl({required this.clientCustom});

  Uri url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/subsidio/new_subsidio', {'q': '{http}'});

  @override
  Future<SubsidioDevolucionModel> newSubsidioDevolucion(
      ParamsNewSubsidio params) async {
    try {
      var response = await clientCustom.request('POST', url.toString(),
          jsonEncode(params.toMap()), (i) => responseFromJson(i));

      SubsidioDevolucionModel result =
          SubsidioDevolucionModel.fromJson(response.data[0]);
      return result;
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
