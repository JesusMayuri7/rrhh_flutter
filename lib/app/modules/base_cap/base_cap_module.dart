import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/base_cap/data/datasource/i_presupuesto_cap_datasource.dart';
import 'package:rrhh_clean/app/modules/base_cap/external/get_certificado_cap_datasource_impl.dart';
import 'package:rrhh_clean/app/app_guard.dart';
import 'data/datasource/i_list_cap_datasoruce.dart';
import 'data/datasource/i_parameter_cap_datasoruce.dart';
import 'domain/use_cases/calcular_list_base_cap_usecase.dart';
import 'data/repositories/listar_cap_repository_impl.dart';

import 'domain/use_cases/get_presupuesto_base_cap_usecase.dart';
import 'external/get_list_cap_datasource_impl.dart';
import 'external/get_pim_cap_datasource_impl.dart';
import 'external/get_pim_cap_datasource_impl_2023.dart';
import 'external/get_presupuesto_cap_impl.dart';
import 'presenter/cap/listado_cap/bloc/listado_cap_bloc.dart';
import 'presenter/cap/parameter_cap/bloc/parameter_cap_bloc.dart';

import 'domain/use_cases/get_list_base_cap_usecase.dart';
import 'external/get_parameter_cap_datasource_impl.dart';

import 'domain/use_cases/get_parameter_base_cap_usecase.dart';

import 'base_cap_page.dart';

class BaseCapModule extends Module {
  @override
  final List<Bind> binds = [
    //EXTERNAL
    Bind((i) => GetParameterCapDatasourceImpl(httpCustom: i())),
    Bind((i) => GetListCapDatasourceImpl(httpCustom: i())),
    Bind((i) => GetCertificadoCapDatasourceImpl(httpCustom: i())),
    Bind((i) => GetPimCapDatasourceImpl(httpCustom: i())),

    //2023
    Bind((i) => GetPimCapDatasourceImpl(httpCustom: i())),
    Bind((i) => GetPresupuestoCapDatasourceImpl(
        getCertificadoCapDatasourceImpl: i<GetCertificadoCapDatasourceImpl>(),
        getPimCapDatasourceImpl: i<GetPimCapDatasourceImpl>())),

    //2023
    Bind((i) => GetPimCapDatasourceImpl2023(httpCustom: i())),
    Bind((i) => GetPresupuestoCapDatasourceImpl(
        getCertificadoCapDatasourceImpl: i<GetCertificadoCapDatasourceImpl>(),
        getPimCapDatasourceImpl: i<GetPimCapDatasourceImpl>())),

    // REPOSITORY
    Bind((i) => BaseCapRepositoryImpl(
        iParameterCapDataSoruce: i<IParameterCapDataSoruce>(),
        iListCapDataSoruce: i<IListCapDataSoruce>(),
        iPresupuestoCapDatasource: i<IPresupuestoCapDatasource>())),

    //USE CASE
    Bind((i) => GetParameterBaseCapUseCase(iBaseCapRepository: i())),
    Bind((i) => GetListBaseCapUseCase(iBaseCapRepository: i())),
    Bind((i) => CalcularListBaseCapUseCase()),
    Bind((i) => GetPresupuestoBaseCapUseCase(iBaseCapRepository: i())),

    // BLOC
    Bind((i) => ListadoCapBloc(i())),
    Bind.singleton((i) => ParameterCapBloc(
        getParameterBaseCapUseCase: i.get<GetParameterBaseCapUseCase>(),
        calcularListBaseCapUseCase: i.get<CalcularListBaseCapUseCase>(),
        getListBaseCapUseCase: i.get<GetListBaseCapUseCase>(),
        getPresupuestoBaseCapUseCase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BaseCapPage(), guards: [AppGuard()]),
  ];
}
