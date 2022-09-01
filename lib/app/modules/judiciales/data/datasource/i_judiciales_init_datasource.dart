import 'dart:io';

import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/external/get_areas_impl.dart';
import 'package:rrhh_clean/core/external/get_fuentes_impl.dart';
import 'package:rrhh_clean/core/external/get_metas_impl.dart';

abstract class IJudicialesInitDatasource {
  Future<List<ResponseModel>> getDataInit(String anio);
}

class GetJudicialesInitDatasource implements IJudicialesInitDatasource {
  final GetMetasImpl getMetasImpl;
  final GetAreasImpl getAreasImpl;
  final GetFuentesImpl getFuentesImpl;

  GetJudicialesInitDatasource(
      {required this.getMetasImpl,
      required this.getAreasImpl,
      required this.getFuentesImpl});

  @override
  Future<List<ResponseModel>> getDataInit(String anio) async {
    try {
      var responseAreas = this.getAreasImpl.getAreas();
      var responseMetas = this.getMetasImpl.getMetas(anio);
      var responseFuentes = this.getFuentesImpl.getFuentes(anio);

      List<ResponseModel> listData =
          await Future.wait([responseAreas, responseMetas, responseFuentes]);

      return listData;
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
