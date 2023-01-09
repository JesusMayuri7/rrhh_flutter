import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/base_prac/bloc/base_prac_bloc.dart';
import 'package:rrhh_clean/app/modules/base_prac/data/prac_repository_impl.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/alta_baja_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/get_data_initial_prac_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/listar_prac_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/updated_prac_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/external/alta_baja_prac_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/base_prac/external/listar_prac_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/base_prac/external/updated_prac_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/base_prac/main_prac_page.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/alta_baja/bloc/alta_baja_prac_bloc.dart';

import 'package:rrhh_clean/app/modules/base_prac/presenter/list_prac/bloc/list_prac_bloc.dart';

import 'domain/export_prac_use_case.dart';
import 'external/get_data_initial_prac_impl.dart';

class BasePracModule extends Module {
  @override
  final List<Bind> binds = [
    //BLOC
    Bind.lazySingleton((i) => BasePracBloc(getDataInitialPracUseCase: i()),
        export: true),
    Bind.lazySingleton(
        (i) => ListPracBloc(
            exportPracUseCase: i(),
            altaBajaPracBloc: i(),
            listarPracUseCase: i(),
            updatedPracUseCase: i()),
        export: true),
    Bind((i) => AltaBajaPracBloc(altaBajaPracUseCase: i())),

    //REPOSITORY
    Bind(
      (i) => PracRepositoryImpl(
          iPracDataSource: i(),
          iAltaBajaPracDataSource: i(),
          iGetDataInitialPracDatasource: i(),
          iUpdatedPracDataSource: i()),
    ),

    // DATASOURCE
    Bind((i) => GetDataInitialPracDatasourceImpl(
        getFuentesImpl: i(), getMetasImpl: i(), getAreasImpl: i())),
    Bind((i) => ListarPracDataSourceImpl(httpCustom: i())),
    Bind((i) => AltaBajaPracDataSourceImpl(httpCustom: i())),
    Bind((i) => UpdatedPracDataSourceImpl(httpCustom: i())),

    //USECASE
    Bind((i) => ListarPracUseCase(iPracRepository: i())),
    Bind((i) => ExportPracUseCase()),
    Bind((i) => AltaBajaPracUseCase(iPracRepository: i())),
    Bind((i) => GetDataInitialPracUseCase(iPracRepository: i())),
    Bind((i) => UpdatedPracUseCase(iPracRepository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainPracPage()),
  ];
}
