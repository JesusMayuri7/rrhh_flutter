import 'dart:io';

import 'package:rrhh_clean/app/modules/subsidio/data/i_update_subsidio_devolucion_datasource.dart';
import 'package:rrhh_clean/app/modules/subsidio/data/subsidio_devolucion_model.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/update_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class UpdateSubsidioDevolucionDatasourceImpl
    implements IUpdateSubsidioDevolucionDatasource {
  Uri url = Uri.http('rrhh.pvn.gob.pe', '/api/subsidio/devolucion/');

  final IClientCustom clientCustom;

  UpdateSubsidioDevolucionDatasourceImpl({required this.clientCustom});

  @override
  Future<SubsidioDevolucionEntity> updateSubsidioDevolucion(
      ParamsUpdateSubsidio params) async {
    Map<String, dynamic> map = {
      "id": params.subsidioDevolucionId,
      "campo": params.campo,
      "valor": params.valor
    };

    try {
      var response = await clientCustom.request(
          'POST', url.toString(), map, (i) => responseFromJson(i));

      //var body = jsonDecode(response.body);

      SubsidioDevolucionModel result =
          SubsidioDevolucionModel.fromJson(response.data);

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
