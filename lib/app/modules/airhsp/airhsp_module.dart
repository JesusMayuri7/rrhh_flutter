import 'package:flutter_modular/flutter_modular.dart';
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
    Bind((i) => ListarDatasourceImpl(httpCustom: i())),
    Bind((i) => ListarRepositoryImpl(datasource: i())),
    Bind((i) => ListarUseCase(i())),
    Bind((i) => ConceptosUseCase(i())),
    Bind((i) => AirhspBloc(i(), i(), i()), isSingleton: false),
    Bind((i) => ConceptosBloc((i())), isSingleton: false),
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
