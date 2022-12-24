import 'package:rrhh_clean/app/modules/agenda/agenda_list_datasource.dart';
import 'package:rrhh_clean/app/modules/agenda/agenda_list_usecase.dart';
import 'package:rrhh_clean/app/modules/agenda/agenda_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/agenda/cubit/agenda_list_cubit.dart';
import 'package:rrhh_clean/app/modules/agenda/agenda_list_page.dart';

import 'agenda_save_datasource.dart';
import 'agenda_save_usecase.dart';

class AgendaModule extends Module {
  @override
  final List<Bind> binds = [
    // USECASE
    Bind.lazySingleton((i) => AgendaListUseCase(iAgendaRepository: i())),
    Bind.lazySingleton((i) => AgendaSaveUseCase(iAgendaRepository: i())),

    // CUBIT
    Bind.lazySingleton(
        (i) => AgendaListCubit(agendaListUseCase: i(), agendaSaveUseCase: i())),

    // REPOSITORY
    Bind.lazySingleton((i) => AgendaRepositoryImpl(
        iAgendaListDatasource: i(), iAgendaSaveDatasource: i())),

    // DATASOURCE
    Bind.lazySingleton((i) => AgendaListDatasourceImpl(httpCustom: i())),
    Bind.lazySingleton((i) => AgendaSaveDatasourceImpl(httpCustom: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AgendaListPage()),
  ];
}
