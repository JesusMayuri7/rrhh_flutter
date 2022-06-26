import 'dart:io';

import 'package:dio/dio.dart';

import 'package:rrhh_clean/app/modules/airhsp/data/datasources/i_download_file_datasource.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
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
    //Map<String, String?> params = {"anio": anio};
    // print('external ' + params.toString());
    List<List<Object>> dataList = [];
    try {
      Response response = await iClientCustom.download(
          'http://dggrp.mef.gob.pe/airhsp/repnom.ejecutar.do?accion=generar&ejercicio=2022&tipoPersona=$tipoPersona&secejec=1078&excedente=%27O%27,%27T%27,%27R%27,%27V%27');

      await FileSaveHelper.saveAndLaunchFile(
          response.data, 'ReporteDatoslaboralesNomina1078_$tipoPersona.xlsx');

      print('data ' + dataList.toString());
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
