import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/import/presenter/bloc/import_bloc.dart';
import 'package:rrhh_clean/app/modules/import/presenter/main_import_page.dart';

class ImportModule extends Module {
  @override
  final List<Bind> binds = [Bind((i) => ImportBloc())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainImportPage())
  ];
}
