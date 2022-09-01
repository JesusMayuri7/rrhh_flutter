import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/import/data/i_import_file_datasource.dart';
import 'package:rrhh_clean/app/modules/import/presenter/bloc/import_bloc.dart';
import 'package:rrhh_clean/app/modules/import/presenter/main_import_page.dart';
import 'package:rrhh_clean/app/modules/import/repositories/import_file_repository_impl.dart';

import 'presenter/domain/import_file_use_case.dart';

class ImportModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ImportBloc(i())),
    Bind((i) => ImportFileUseCase(i())),
    Bind((i) => ImportFileRepositoryImpl(iImportFileDatasource: i())),
    Bind(((i) => ImportFileDatasourceImpl(httpCustom: i()))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainImportPage())
  ];
}
