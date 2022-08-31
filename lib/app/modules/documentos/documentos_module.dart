import 'package:flutter_modular/flutter_modular.dart';

import 'data/documentos_repository_impl.dart';
import 'datasource/i_documentos_list_datasource.dart';
import 'datasource/i_documentos_new_datasource.dart';
import 'domain/documentos_list_usecase.dart';
import 'domain/new_documentos_use_case.dart';
import 'main_documentos_page.dart';
import 'presenter/bloc/list/documentos_list_bloc.dart';
import 'presenter/bloc/new/bloc/new_documento_bloc.dart';

class DocumentosModule extends Module {
  @override
  final List<Bind> binds = [
    //Datasource
    Bind.lazySingleton((i) => GetListDocumentosImpl(httpCustom: i())),
    Bind.lazySingleton((i) => NewDocumentoDatasourceImpl(httpCustom: i())),

    //Repository
    Bind.lazySingleton((i) => DocumentosRepositoryImpl(
          iDocumentosListDataSource: i<IDocumentosListDataSource>(),
          iDocumentosNewDataSource: i<IDocumentosNewDataSource>(),
          //iDocumentosUpdateDataSource: i<IDocumentosUpdateDataSource>()
        )),

    //Bloc
    Bind.lazySingleton((i) => DocumentosListBloc(documentosListUseCase: i()),
        export: true),
    Bind.lazySingleton((i) => NewDocumentoBloc(newDocumentoUseCase: i())),
    //Bind.lazySingleton((i) => UpdateDocumentoBloc()),

    //UseCase
    Bind.lazySingleton(
        (i) => DocumentosListUseCase(iDocumentosRepository: i())),
    Bind.lazySingleton((i) => NewDocumentoUseCase(iDocumentosRepository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainDocumentosPage()),
  ];
}
