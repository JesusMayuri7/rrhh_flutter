import 'dart:io';

import 'package:rrhh_clean/app/modules/base_prac/data/i_get_data_initial_prac_datasource.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';

import 'package:rrhh_clean/core/external/get_areas_impl.dart';
import 'package:rrhh_clean/core/external/get_fuentes_impl.dart';
import 'package:rrhh_clean/core/external/get_metas_impl.dart';

class GetDataInitialPracDatasourceImpl
    implements IGetDataInitialPracDatasource {
  final GetFuentesImpl getFuentesImpl;
  final GetMetasImpl getMetasImpl;
  final GetAreasImpl getAreasImpl;

  GetDataInitialPracDatasourceImpl(
      {required this.getFuentesImpl,
      required this.getMetasImpl,
      required this.getAreasImpl});

  @override
  Future<List<ResponseModel>> getDataInitial(String anio) async {
    try {
      print('get data initial');
      var responseFuentes = this.getFuentesImpl.getFuentes(anio);
      var responseMetas = this.getMetasImpl.getMetas(anio);
      var responseAreas = this.getAreasImpl.getAreas(anio);

      List<ResponseModel> listData =
          await Future.wait([responseFuentes, responseMetas, responseAreas]);
      print('listadata ' + listData.toString());
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
