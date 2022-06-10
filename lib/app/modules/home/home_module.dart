import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/home/data/home_repository_impl.dart';
import 'package:rrhh_clean/app/modules/home/domain/get_home_cap_estado_opp_usecase.dart';
import 'package:rrhh_clean/app/modules/home/domain/get_home_data_initial_usecase.dart';
import 'package:rrhh_clean/app/modules/home/domain/get_home_devengado_total_usescase.dart';
import 'package:rrhh_clean/app/modules/home/external/get_home_cap_estado_opp_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/home/external/get_home_data_initial_datasource_impl.dart';

import 'package:rrhh_clean/app/modules/home/external/get_home_devengado_total_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/home/presenter/home_devengado_total/bloc/homedevengadototal_bloc.dart';
import 'package:rrhh_clean/core/config/http_custom.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeDevengadoTotalBloc(
        getHomeDevengadoTotalUseCase: i(),
        getHomeCapEstadoOppUseCase: i(),
        getHomeDataInitialUseCase: i())),

    //Use Case
    Bind((i) => GetHomeDevengadoTotalUseCase(iHomeRepository: i())),
    Bind((i) => GetHomeCapEstadoOppUseCase(iHomeRepository: i())),
    Bind((i) => GetHomeDataInitialUseCase(iHomeRepository: i())),

    //Repository
    Bind((i) => HomeRepositoryImpl(
        getHomeDevengadoTotalDatasource: i(),
        getHomeCapEstadoOppDatasource: i(),
        getHomeDataInitialDatasource: i())),

    //CONFIG
    Bind((i) => HttpCustom()),
    //DataSource
    Bind((i) => GetHomeDevengadoTotalDatasourceImpl(httpCustom: i())),
    Bind((i) => GetHomeCapEstadoOppDatasourceImpl(httpCustom: i())),
    Bind((i) => GetHomeDataInitialDatasourceImpl(
        getHomeCapEstadoOppDatasourceImpl: i(),
        getHomeDevengadoTotalDatasourceImpl: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
