import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/get_modalidad_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_codigo_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_presupuesto_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/cubit/airhsp_cubit.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/pages/main_codigo_page.dart';
import 'package:rrhh_clean/core/config/http_custom.dart';
import 'package:rrhh_clean/core/external/get_modalidades_impl.dart';
import 'domain/use_cases/calcular_airhsp_use_case.dart';
import 'domain/use_cases/totales_airhsp_use_case.dart';
import 'domain/use_cases/download_file_use_case.dart';
import 'external/airhsp_codigo_datasource.dart';
import 'external/airhsp_presupuesto_datasource.dart';

import 'external/download_file_datasource_impl.dart';
import 'presenter/bloc/codigo_bloc/airhsp_codigo_bloc.dart';
import 'presenter/bloc/conceptos_bloc/conceptos_bloc.dart';
import 'presenter/pages/personal/airhsp_personal_page.dart';

import 'data/repositories/listar_repository_impl.dart';
import 'domain/use_cases/conceptos_use_case.dart';
import 'domain/use_cases/listar_use_case.dart';
import 'external/airhsp_listar_datasource.dart';
import 'presenter/bloc/air_bloc/airhsp_bloc.dart';
import 'presenter/pages/presupuesto/airhsp_presupuesto_page.dart';
import 'presenter/pages/presupuesto/bloc/airhsp_presupuesto_bloc.dart';
//import 'presenter/pages/conceptos/conceptos_page.dart';

class AirhspModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HttpCustom()),

    //AIRHSP
    Bind.singleton((i) => AirhspCubit(getModalidadUseCase: i())),
    Bind((i) => GetModalidadUseCase(repositoryApp: i())),
    Bind((i) => GetModalidadesImpl(httpCustom: i())),

    //PRESUPUESTO
    Bind.lazySingleton(
        (i) => AirhspPresupuestoBloc(listarAirhspPresupuestoUseCase: i(),calcularAirhspUseCase: i(),totalesAirhspUseCase: i())),
    Bind((i) => ListarAirhspPresupuestoUseCase(i())),
    Bind((i) => CalcularAirhspUseCase()),
    Bind((i) => TotalesAirhspUseCase()),
    Bind((i) => AirhspPresupuestoDataSourceImpl(httpCustom: i())),

    //PERSONAL
    Bind.factory((i) => AirhspBloc(i(), i(), i())),
    Bind.factory((i) => ConceptosBloc(i())),
    Bind((i) => ListarDatasourceImpl(httpCustom: i())),
    //Bind((i) => DownloadFileDatasourceImpl(iClientCustom: i())),
    Bind((i) => DownloadFileDatasourceImpl(iClientCustom: i())),

   //CODIGOS
    Bind.singleton((i) => AirhspCodigoBloc(listarAirhspCodigoUseCase: i())),
    Bind((i) => ListarAirhspCodigoUseCase(i())),
    Bind((i) => AirhspCodigoDataSourceImpl(httpCustom: i())),

    //COMMON
    Bind((i) => ListarRepositoryImpl(
        iModalidadesDatasourceApp: i(),
        datasource: i(),
        iDownloadFileDatasource: i(),
        iAirhspPresupuestoDatasource: i(), iListarCodigoDatasource: i())),
    Bind((i) => ListarUseCase(i())),
    Bind((i) => TotalesAirhspUseCase()),
    Bind((i) => DownloadFileUseCase(repository: i())),
    Bind((i) => ConceptosUseCase(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AirhspPersonalPage()),
    ChildRoute('/personal', child: (_, args) => AirhspPersonalPage()),
    ChildRoute('/codigos', child: (_, args) => MainCodigoPage()),
    ChildRoute('/presupuesto', child: (_, args) => ListAirhspPresupuestoPage()),
  ];
}
