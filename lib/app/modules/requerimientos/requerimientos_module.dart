import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/requerimientos/datasource/requerimiento_repository_impl.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_list_usecase.dart';
import 'package:rrhh_clean/app/modules/requerimientos/main_requerimientos_page.dart';

import 'datasource/i_requerimiento_initial_datasource.dart';
import 'datasource/i_requerimiento_list_datasource.dart';
import 'domain/requerimientos_initial_usecase.dart';
import 'presenter/bloc/requerimientos_bloc.dart';
import 'presenter/detail/bloc/requerimiento_detail_bloc.dart';
import 'presenter/list/bloc/requerimiento_list_bloc.dart';
import 'presenter/new/bloc/requerimiento_new_bloc.dart';

class RequerimientosModule extends Module {
  @override
  final List<Bind> binds = [
    //Bloc
    Bind.singleton(
        (i) => RequerimientosBloc(getRequerimientosInitialUseCase: i())),
    Bind.singleton((i) => RequerimientoListBloc(requerimientoListUseCase: i())),
    Bind.singleton((i) => RequerimientoDetailBloc(requerimientoListBloc: i())),

    Bind.singleton((i) => RequerimientoNewBloc()),

    //UseCase
    Bind.lazySingleton(
        (i) => RequerimientoListUseCase(iRequerimientoRepository: i())),
    Bind.lazySingleton(
        (i) => GetRequerimientosInitialUseCase(iRequerimientoRepository: i())),

    //Repository
    Bind.lazySingleton((i) => RequerimientoRepositoryImpl(
        iRequerimientoListDataSource: i(),
        iRequerimientoInitialDataSource: i())),

    //Datasource
    Bind.lazySingleton((i) => GetListRequerimientos(httpCustom: i())),
    Bind.lazySingleton((i) => GetRequerimientosInitialImpl(
        getAreasImpl: i(),
        getFuentesImpl: i(),
        getMetasImpl: i(),
        getModalidadesImpl: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainDocumentosPage()),
  ];
}
