import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'package:rrhh_clean/app/modules/airhsp/data/datasources/i_download_file_datasource.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

class DownloadFileDatasourceImpl implements IDownloadFileDatasource {
  Uri url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/presupuestal/certificacion', {'q': '{http}'});

  final IClientCustom iClientCustom;
  DownloadFileDatasourceImpl({
    required this.iClientCustom,
  });
  late File file;

  @override
  Future<ResponseModel> downloadFile(String tipoPersona) async {
    final String fechaActual = DateFormat('yyyy-MM-dd').format(DateTime.now());
    try {
      Response response = await iClientCustom.download(
          'http://dggrp.mef.gob.pe/airhsp/repnom.ejecutar.do?accion=generar&ejercicio=2023&tipoPersona=$tipoPersona&secejec=1078&excedente=%27O%27,%27T%27,%27R%27,%27V%27');
      String modalidad = tipoPersonaToModalidad(tipoPersona);
      await FileSaveHelper.saveAndLaunchFile(response.data,
          '${fechaActual}_ReporteDatoslaboralesNomina1078_$modalidad.xlsx');
      return ResponseModel(status: true, message: 'ok');
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

tipoPersonaToModalidad(String _tipoPersona) {
  switch (_tipoPersona) {
    case '1':
      return 'CAP';
    case '4':
      return 'CAS';
    case '6':
      return 'PRAC';
    default:
      return 'ERROR';
  }
}
