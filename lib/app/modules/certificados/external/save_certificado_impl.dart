import 'dart:convert';
import 'dart:io';

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../data/datasources/i_save_certificado_datasource.dart';

class SaveCertificadoDatasourceImpl implements ISaveCertificadoDatasource {
  var url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/presupuesto/save_certificado', {'q': '{http}'});

  final IClientCustom httpCustom;
  SaveCertificadoDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> saveCertificado(
      {required String detalle,
      required String tipo,
      required String certiificado,
      required String anio,
      required double montoCertificado,
      required int modalidadId,
      required List<Map<String, dynamic>> conceptoClasificador}) async {
    Map<String, dynamic> params = {
      "detalle": detalle,
      "tipo": tipo,
      "dsc_certificado": certiificado,
      "anio": anio,
      "monto": montoCertificado,
      "modalidad_id": modalidadId,
      "clasificador_concepto": conceptoClasificador
    };

    try {
      var response = await httpCustom.request('POST', url.toString(),
          json.encode(params), (i) => responseFromJson(i));
      return response;
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
