import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/judiciales/presenter/datagrid/detail/cubit/judicial_detail_cubit.dart';
import 'cubit/judiciales_bloc.dart';

import 'data/datasource/i_judiciales_init_datasource.dart';
import 'data/datasource/i_judiciales_list_datasource.dart';
import 'data/datasource/i_judiciales_new_datasource.dart';

import 'data/judiciales_repository_impl.dart';

import 'domain/get_judiciales_initial_usecase.dart';
import 'domain/judiciales_list_usecase.dart';
import 'domain/new_judiciales_use_case.dart';

import 'presenter/bloc/list/judiciales_list_bloc.dart';
import 'presenter/bloc/new/bloc/new_judicial_bloc.dart';

import 'main_judiciales_page.dart';

class JudicialesModule extends Module {
  @override
  final List<Bind> binds = [
    //Bloc
    Bind.lazySingleton((i) => JudicialesBloc(getJudicialesInitialUseCase: i())),
    Bind.lazySingleton((i) => JudicialesListBloc(judicialesListUseCase: i())),
    Bind.lazySingleton((i) => NewJudicialBloc(newJudicialUseCase: i())),
    Bind.lazySingleton((i) => JudicialDetailCubit(i())),
    //Bind.lazySingleton((i) => UpdateJudicialBloc()),

    

    //UseCase
    Bind((i) => GetJudicialesInitialUseCase(iJudicialesRepository: i())),
    Bind((i) => JudicialesListUseCase(iJudicialesRepository: i())),
    Bind((i) => NewJudicialUseCase(iJudicialesRepository: i())),

    //Repository
    Bind((i) => JudicialesRepositoryImpl(
          iJudicialesInitialDatasource: i(),
          iJudicialesListDataSource: i(),
          iJudicialesNewDataSource: i(),
        )),

    //Datasource
    // Bind.lazySingleton((i) => GetDataInitialDatasourceImpl(getAreasImpl: i(), getFuentesImpl: i(), getMetasImpl: i())),
    Bind((i) => GetJudicialesInitDatasource(
        getAreasImpl: i(), getFuentesImpl: i(), getMetasImpl: i())),
    Bind((i) => GetListJudicialesImpl(httpCustom: i())),
    Bind((i) => NewJudicialDatasourceImpl(httpCustom: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainJudicialesPage()),
  ];
}
