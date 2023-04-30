import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/base_cas/data/datasources/i_certificado_cas_datasource.dart';
import 'package:rrhh_clean/app/modules/base_cas/data/datasources/i_presupuesto_cas_datasource.dart';
import 'package:rrhh_clean/app/app_guard.dart';

import 'domain/usecases/certificado_cas_use_case.dart';
import 'domain/usecases/initial_cas_use_case.dart';
import 'domain/usecases/presupuesto_cas_use_case.dart';
import 'external/certificado_cas_datasource.dart';
import 'external/pim_cas_datasource.dart';
import 'external/presupuesto_cas_datasource.dart';
import 'presenter/base_cas_page/listado/listado_cas_page/parameters_page/bloc/headparameters_bloc.dart';
import 'presenter/main_base_cas_page.dart';

import 'data/datasources/i_base_cas_datasource.dart';
import 'data/datasources/i_base_excel_datasource.dart';
import 'data/datasources/i_initial_cas_datasource.dart';
import 'data/datasources/i_pim_cas_datasource.dart';
import 'data/repositories/listar_repository_impl.dart';

import 'domain/usecases/calcular_cas_use_case.dart';
import 'domain/usecases/listar_cas_use_case.dart';

import 'domain/usecases/pim_cas_use_case.dart';
import 'domain/usecases/resumen_cas_use_case.dart';
import 'external/base_cas_datasource.dart';
import 'external/initial_cas_datasource.dart';
import 'external/listar_excel_datasource.dart';

import 'presenter/presupuesto_page/bloc/presupuesto_bloc.dart';
import 'presenter/resumen_page/bloc/resumen_bloc.dart';

class BaseCasModule extends Module {
  @override
  final List<Bind> binds = [
    // EXTERNAL
    //Bind((i) => BaseCasDatasourceImpl(httpCustom: i())),
    Bind((i) => BaseCasDatasourceImplProyeccion(httpCustom: i())),
    Bind((i) => BaseExcelDatasourceImpl(httpCustom: i())),
    Bind((i) => InitialCasDatasourceImpl(httpCustom: i())),
    Bind((i) => PimCasDatasourceImpl(httpCustom: i())),
    Bind((i) => CertificadoCasDatasourceImpl(httpCustom: i())),

    //2023
    Bind((i) => PresupuestoCasDatasourceImpl(
        getCertificadosCasImpl: i<CertificadoCasDatasourceImpl>(),
        getPimCasImpl: i<PimCasDatasourceImpl>())),

    //2023
    /*    Bind((i) => PresupuestoCasDatasourceImplLey(
        getCertificadosCasImpl: i<PimCasLeyDatasourceImpl>(),
        getPimCasImpl: i<PimCasLeyDatasourceImpl>())),  */

    // REPOSITORY

    Bind((i) => ListarRepositoryImpl(
        baseExceldatasource: i<IBaseExcelDatasource>(),
        baseCasdatasource: i<IBaseCasDatasource>(),
        initialCasdatasource: i<IInitialCasDatasource>(),
        pimCasDatasource: i<IPimCasDatasource>(),
        certificadoCasDatasource: i<ICertificadoCasDatasource>(),
        presupuestoCasDatasource: i<IPresupuestoCasDatasource>())),

    //USE CASE
    Bind((i) => ListarCasUseCase(i())),
    Bind((i) => CalcularCasUseCase(i())),
    Bind((i) => InitialCasUseCase(i())),
    Bind((i) => ResumenCasUseCase()),
    Bind((i) => PimCasUseCase(i())),
    Bind((i) => CertificadoCasUseCase(i())),
    Bind((i) => PresupuestoCasUseCase(i())),

    // BLOC
    Bind.lazySingleton(
        (i) => HeadParametersBloc(
            initialUseCase: i(),
            calcularCasUseCase: i(),
            listarUseCase: i(),
            presupuestoCasUseCase: i()),
        export: true),
    Bind.lazySingleton((i) => ResumenBloc(i(), i(), i()), export: true),
    Bind.lazySingleton((i) => PresupuestoBloc(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => MainBaseCasPage(), guards: [AppGuard()]),
  ];
}
