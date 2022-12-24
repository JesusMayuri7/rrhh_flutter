// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:rrhh_clean/core/data/datasource/i_areas_datasource_app.dart';
import 'package:rrhh_clean/core/data/datasource/i_fuentes_datasource_app.dart';
import 'package:rrhh_clean/core/data/datasource/i_metas_datasource_app.dart';
import 'package:rrhh_clean/core/data/datasource/i_modalidades_datasource_app.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

abstract class IRequerimientosInitalDatasource {
  Future<List<ResponseModel>> getDataInit(String anio);
}

class GetRequerimientosInitialImpl implements IRequerimientosInitalDatasource {
  final IMetasDatasourceApp getMetasImpl;
  final IAreasDatasourceApp getAreasImpl;
  final IFuentesDatasourceApp getFuentesImpl;
  final IModalidadesDatasourceApp getModalidadesImpl;

  GetRequerimientosInitialImpl({
    required this.getMetasImpl,
    required this.getAreasImpl,
    required this.getFuentesImpl,
    required this.getModalidadesImpl,
  });

  @override
  Future<List<ResponseModel>> getDataInit(String anio) async {
    try {
      var responseAreas = this.getAreasImpl.getAreas();
      var responseMetas = this.getMetasImpl.getMetas(anio);
      var responseFuentes = this.getFuentesImpl.getFuentes(anio);
      var responseModalidades = this.getModalidadesImpl.getModalidades(anio);

      List<ResponseModel> listData = await Future.wait(
          [responseAreas, responseMetas, responseFuentes, responseModalidades]);

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
