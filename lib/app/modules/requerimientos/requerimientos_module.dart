import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/requerimientos/data/requerimiento_repository_impl.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_list_usecase.dart';
import 'package:rrhh_clean/app/modules/requerimientos/main_requerimientos_page.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/bloc/requerimiento_list_bloc.dart';

import 'datasource/i_requerimiento_list_datasource.dart';

class RequerimientosModule extends Module {
  @override
  final List<Bind> binds = [
    //Bloc
    Bind.lazySingleton((i) => RequerimientoListBloc()),

    //UseCase
    Bind.lazySingleton((i) => RequerimientoListUseCase()),

    //Repository
    Bind.lazySingleton((i) => RequerimientoRepositoryImpl()),

    //Datasource
    Bind.lazySingleton((i) => GetListRequerimientos(httpCustom: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainDocumentosPage()),
  ];
}
