import 'package:flutter_modular/flutter_modular.dart';
import 'domain/use_cases/download_file_use_case.dart';
import 'external/download_file_datasource_impl.dart';
import 'presenter/bloc/conceptos_bloc/conceptos_bloc.dart';
import 'presenter/pages/home_page.dart';

import 'data/repositories/listar_repository_impl.dart';
import 'domain/use_cases/conceptos_use_case.dart';
import 'domain/use_cases/listar_use_case.dart';
import 'external/airhsp_listar_datasource.dart';
import 'presenter/bloc/air_bloc/airhsp_bloc.dart';
import 'presenter/pages/conceptos/conceptos_page.dart';

class AirhspModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => AirhspBloc(i(), i(), i())),
    Bind.factory((i) => ConceptosBloc((i()))),
    Bind((i) => ListarDatasourceImpl(httpCustom: i())),
    Bind((i) => DownloadFileDatasourceImpl(iClientCustom: i())),
    Bind((i) =>
        ListarRepositoryImpl(datasource: i(), iDownloadFileDatasource: i())),
    Bind((i) => ListarUseCase(i())),
    Bind((i) => DownloadFileUseCase(repository: i())),
    Bind((i) => ConceptosUseCase(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ChildRoute('/conceptos',
        child: (_, args) => ConceptosPage(
              codPlaza: args.data,
              nombres: args.data,
              tipoPersona: args.data,
            )),
  ];
}
