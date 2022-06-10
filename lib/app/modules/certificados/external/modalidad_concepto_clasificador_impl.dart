import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../data/datasources/i_modalidad_concepto_clasificador_datasource.dart';
import '../../../../core/data/models/clasificador_model.dart';
import '../data/model/concepto_model.dart';
import '../data/model/modalidad_concepto_clasificador_model.dart';
import '../data/model/modalidad_model.dart';

import '../../../../core/errors/exceptions.dart';

class ModalidadConceptoDatasourceImpl
    implements IModalidadConceptoClasificadorDatasource {
  var url = Uri.http('rrhh.pvn.gob.pe', '/api/modalidad_concepto_clasificador',
      {'q': '{http}'});

  ModalidadConceptoDatasourceImpl({required this.httpCustom});

  final IClientCustom httpCustom;

  @override
  Future<ModalidadConceptoClasificadorModel>
      modalidadConceptoClasificador() async {
    try {
      ResponseModel response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => responseFromJson(i));

      List<ModalidadModel> modalidad =
          modalidadFromJson(jsonEncode(response.data['modalidad']));

      List<ConceptoModel> concepto =
          conceptoFromJson(jsonEncode(response.data['concepto']));

      List<ClasificadorModel> clasificador =
          clasificadorFromJson(jsonEncode(response.data['clasificador']));

      return ModalidadConceptoClasificadorModel(
          modalidad: modalidad, concepto: concepto, clasificador: clasificador);
    } on SocketException {
      throw ServerException('Sin conexion');
    } on HttpException {
      throw ServerException("No se encuentra la plaza");
    } on FormatException {
      throw ServerException("Formato incorrecto");
    } catch (e) {
      // print(e);
      throw ServerException(e.toString());
    }
  }
}
