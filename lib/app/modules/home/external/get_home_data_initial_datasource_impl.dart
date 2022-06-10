import 'dart:io';

import 'package:rrhh_clean/core/errors/exceptions.dart';

import 'package:rrhh_clean/app/modules/home/data/i_get_home_data_initial_datasource.dart';
import 'package:rrhh_clean/app/modules/home/external/get_home_cap_estado_opp_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/home/external/get_home_devengado_total_datasource_impl.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

class GetHomeDataInitialDatasourceImpl
    implements IGetHomeDataInitialDatasource {
  final GetHomeCapEstadoOppDatasourceImpl getHomeCapEstadoOppDatasourceImpl;
  final GetHomeDevengadoTotalDatasourceImpl getHomeDevengadoTotalDatasourceImpl;

  GetHomeDataInitialDatasourceImpl(
      {required this.getHomeCapEstadoOppDatasourceImpl,
      required this.getHomeDevengadoTotalDatasourceImpl});

  @override
  Future<List<ResponseModel>> getHomeDataInitial() async {
    try {
      var responseDevengado =
          this.getHomeDevengadoTotalDatasourceImpl.getHomeDevengadoTotal();

      var responseCap =
          this.getHomeCapEstadoOppDatasourceImpl.getCapEstadoOpp();

      List<ResponseModel> listData =
          await Future.wait([responseDevengado, responseCap]);
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
