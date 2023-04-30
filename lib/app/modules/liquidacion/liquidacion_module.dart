import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/liquidacion/bloc/liquidacion_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/add_liquidacion_usecase.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/get_liquidacion_data_initial_usecase.dart';
import 'package:rrhh_clean/app/modules/liquidacion/external/get_data_initial_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/liquidacion/external/update_liquidacion_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/list_liquidacion/bloc/liquidacion_list_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/new_liquidacion/bloc/new_liquidacion_bloc.dart';

import 'package:rrhh_clean/core/external/get_certificados_impl.dart';
import 'package:rrhh_clean/app/app_guard.dart';
import 'data/repository/liquidacion_repository_impl.dart';
import 'domain/usecases/get_liquidacion_report_usecase.dart';
import 'domain/usecases/get_liquidacion_resumenes.dart';
import 'domain/usecases/update_liquidacion_detalle.dart';

import 'domain/usecases/update_liquidacion_usecase.dart';
import 'external/add_liquidacion_datasource_impl.dart';
import 'external/get_liquidacion_report_datasource_impl.dart';
import 'external/get_liquidacion_resumen_liquidacion_datasource_impl.dart';
import 'external/get_liquidacion_resumenes_datasource.dart';
import 'presenter/liquidacion_detalle/bloc/liquidacion_detalle_bloc.dart';
import 'presenter/liquidacion_resumen/bloc/liquidacion_resumen_bloc.dart';
import 'presenter/main_liquidacion_page.dart';

import 'domain/usecases/get_liquidacion_resumen_siaf.dart';
import 'domain/usecases/get_list_liquidacion_usecase.dart';
import 'domain/usecases/sum_liquidacion_detalle_usecase.dart';
import 'external/get_liquidacion_resumen_siaf_datasource_impl.dart';
import 'external/get_list_liquidacion_cas_datasource_impl.dart';
import 'external/update_liquidacion_detalle_datasource_impl.dart';
import 'presenter/report_liquidacion/bloc/liquidacion_report_bloc.dart';

class LiquidacionModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LiquidacionBloc(getDataInitialUseCase: i()),
        export: true),
    Bind.lazySingleton(
        (i) => LiquidacionReportBloc(getLiquidacionReportUseCase: i()),
        export: true),
    Bind.lazySingleton(
        (i) => LiquidacionResumenBloc(gettLiquidacionResumenesUseCase: i()),
        export: true),
    Bind.lazySingleton((i) => LiquidacionListBloc(i(), i(), i(), i(), i(), i()),
        export: true),
    Bind.lazySingleton(
        (i) => LiquidacionDetalleBloc(
            liquidacionListBloc: i(),
            sumLiquidacionDetalleUseCase: i(),
            gettLiquidacionResumenUseCase: i(),
            updateLiquidacionDetalleUseCase: i()),
        export: true),
    Bind.lazySingleton(
        (i) => NewLiquidacionBloc(
              i(),
              i(),
            ),
        export: true),

    // Datasource
    Bind((i) => GetLiquidacionCasDatasourceImpl(httpCustom: i())),
    Bind((i) => GetLiquidacionReportDatasourceImpl(httpCustom: i())),
    Bind((i) => GetCertificadosImpl(httpCustom: i())),
    Bind((i) => AddLiquidacionDatasourceImpl(httpCustom: i())),
    Bind((i) => GetLiquidacionResumenSiafDatasourceImpl(httpCustom: i())),
    Bind(
        (i) => GetLiquidacionResumenLiquidacionDatasourceImpl(httpCustom: i())),
    Bind((i) => GetLiquidacionResumenesDatasourceImpl(
        getLiquidacionResumenLiquidacionDatasource: i(),
        getLiquidacionResumenSiafDatasource: i())),
    Bind((i) => UpdateLiquidacionDetalleDatasourceImpl(httpCustom: i())),
    Bind((i) => UpdateLiquidacionDatasourceImpl(httpCustom: i())),
    Bind((i) => GetDataInitialDatasourceImpl(
          getCertificadosImpl: i(),
          getMetasImpl: i(),
          getClasificadoresImpl: i(),
          getFuentesImpl: i(),
        )),

    // Use Case
    Bind((i) => GetListLiquidacionUseCase(repositoryLiquidacion: i())),
    Bind((i) => GetLiquidacionReportUseCase(repositoryLiquidacion: i())),
    Bind((i) => GetLiquidacionDataInitialUseCase(repositoryLiquidacion: i())),
    Bind((i) => SumLiquidacionDetalleUseCase()),
    Bind((i) => AddLiquidacionUseCase(repositoryLiquidacion: i())),
    Bind((i) => UpdateLiquidacionDetalleUseCase(repositoryLiquidacion: i())),
    Bind((i) => UpdateLiquidacionUseCase(repositoryLiquidacion: i())),
    Bind((i) => GettLiquidacionResumenUseCase(repositoryLiquidacion: i())),
    Bind((i) => GettLiquidacionResumenesUseCase(repositoryLiquidacion: i())),
    Bind((i) => LiquidacionRepositoryImpl(
          getLiquidacionReportDatasource: i(),
          getLiquidacionCasDatasource: i(),
          getLiquidacionResumenSiafDatasource: i(),
          updateLiquidacionDetalleDatasource: i(),
          addLiquidacionDatasource: i(),
          getDataInitialDatasourceImpl: i(),
          updateLiquidacionDatasource: i(),
          getLiquidacionResumenesDatasource: i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => MainLiquidacionPage(), guards: [AppGuard()]),
  ];
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
