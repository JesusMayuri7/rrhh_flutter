import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/subsidio/bloc/subsidio_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/data/subsidio_devolucion_repository_impl.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/get_subsidio_devolucion_data_initial_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/get_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/update_subsidio_devolucion_usecase.dart';
import 'package:rrhh_clean/app/modules/subsidio/external/get_data_initial_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/subsidio/external/get_subsidio_devolucion_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/subsidio/external/new_subsidio_devolucion_impl.dart';
import 'package:rrhh_clean/app/modules/subsidio/main_subsidio_page.dart';
import 'package:rrhh_clean/app/modules/subsidio/presenter/bloc/subsidio_devolucion_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/presenter/new_subsidio/bloc/new_subsidio_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/subsidio_guard.dart';

class SubsidioModule extends Module {
  @override
  final List<Bind> binds = [
    // Bloc
    Bind((i) => SubsidioGuard()),
    Bind((i) => SubsidioBloc(i())),
    Bind((i) => NewSubsidioBloc(newSubsidioDevolucionUseCase: i())),
    Bind((i) => SubsidioDevolucionBloc(
        getSubsidioDevolucionUseCase: i(),
        updateSubsidioDevolucionUseCase: i())),

    // UseCase
    Bind((i) => GetSubsidioDevolucionUseCase(subsidioRepository: i())),
    Bind((i) => NewSubsidioDevolucionUseCase(iSubsidioRepository: i())),
    Bind((i) => UpdateSubsidioDevolucionUseCase(subsidioRepository: i())),
    Bind((i) =>
        GetSubsidioDevolucionDataInitialUseCase(subsidioRepository: i())),

    // Repository
    Bind((i) => SubsidioDevolucionRepositoryImpl(
        getSubsidioDevolucionDatasource: i(),
        getDataInitialDatasource: i(),
        newSubsidioDevolucionDatasource: i())),

    // DataSource
    Bind((i) => GetSubsidioDevolucionDatasourceImpl(clientCustom: i())),
    Bind((i) => NewSubsidioDevolucionDatasourceImpl(clientCustom: i())),
    Bind((i) => GetDataInitialDatasourceImpl(
        getCertificadosImpl: i(),
        getClasificadoresImpl: i(),
        getMetasImpl: i(),
        getFuentesImpl: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => MainSubsidioPage(),
      //guards: [SubsidioGuard()]
    ),
  ];
}
