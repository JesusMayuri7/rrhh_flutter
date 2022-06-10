import 'package:flutter_modular/flutter_modular.dart';

import 'confianza_page.dart';
import 'domain/usecases/get_confianza_use_case.dart';

import 'bloc/confianza_bloc.dart';
import 'data/repository/confianza_repository_impl.dart';
import 'domain/usecases/get_area_use_case.dart';
import 'domain/usecases/post_confianza_use_case.dart';
import 'external/get_list_area_datasource_impl.dart';
import 'external/get_list_confianza_datasource_impl.dart';
import 'external/post_confianza_datasoruce_impl.dart';
import 'presenter/edit_confianza/bloc/edti_confianza_bloc.dart';
import 'presenter/listado_confianza/bloc/list_confianza_bloc.dart';

class ConfianzaModule extends Module {
  @override
  final List<Bind> binds = [
    //DataSources
    Bind((i) => GetListConfianzaDataSourceImpl(httpCustom: i())),
    Bind((i) => GetListAreaDataSourceImpl(httpCustom: i())),
    Bind((i) => PostConfianzaDataSourceImpl(httpCustom: i())),

    // Repositories
    Bind((i) => ConfianzaRepositoryImpl(i(), i(), i())),

    // Blocs
    Bind((i) => ConfianzaBloc(i()), isLazy: false),
    Bind((i) => ListConfianzaBloc(i(), i())),
    Bind((i) => EditConfianzaBloc(i())),

    //Use Cases
    Bind((i) => GetListConfianzaUseCase(repository: i())),
    Bind((i) => GetListAreaUseCase(confianzaRepository: i())),
    Bind((i) => PostConfianzaUseCase(repository: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ConfianzaPage())
  ];
}
