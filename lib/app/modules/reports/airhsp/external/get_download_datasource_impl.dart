import 'dart:io';

import 'package:dio/dio.dart';
import 'package:excel/excel.dart';
import 'package:rrhh_clean/app/modules/reports/airhsp/data/i_get_download_datasource.dart';
import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

class GetDownloadDatasourceImpl implements IGetDownloadDatasource {
  Uri url = Uri.http(
      'rrhh.pvn.gob.pe', '/api/presupuestal/certificacion', {'q': '{http}'});

  final IClientCustom iClientCustom;
  GetDownloadDatasourceImpl({
    required this.iClientCustom,
  });
  late File file;

  @override
  Future getDownloadDatasource() async {
    try {
      Response response = await iClientCustom.download(
          'http://dggrp.mef.gob.pe/airhsp/repnom.ejecutar.do?accion=generar&ejercicio=2022&tipoPersona=1&secejec=1078&excedente=%27O%27,%27T%27,%27R%27,%27V%27');

      var _excel = Excel.decodeBytes(response.data);

      List<List<Object>> dataList = [];
      for (var table in _excel.tables.keys) {
        var itemRow = 0;

        for (var row in _excel.tables[table]!.rows
            .sublist(3, _excel.tables[table]?.maxRows)) {
          List<String> listRow = [];
          for (var i = 0; i < row.length; i++) {
            String r = row[i]?.value.toString() ?? '';

            listRow.add(r.toString());
          }
          if (itemRow > 0) dataList.add(listRow);
          itemRow++;
        }
      }
      return dataList;
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
