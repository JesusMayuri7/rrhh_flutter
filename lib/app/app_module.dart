import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/data/auth_repository_impl.dart';
import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/app/modules/auth/external/auth_http_datasource_impl.dart';
import 'package:rrhh_clean/app/splash_page.dart';
import 'package:rrhh_clean/core/config/dio_custom.dart';
import 'package:rrhh_clean/core/config/http_custom.dart';
import 'package:rrhh_clean/core/data/repositories/repository_app_impl.dart';
import 'package:rrhh_clean/core/domain/use_cases/get_certificados_usecases.dart';
import 'package:rrhh_clean/core/domain/use_cases/get_clasificadores_usecase.dart';
import 'package:rrhh_clean/core/domain/use_cases/get_meta_usecase.dart';
import 'package:rrhh_clean/core/external/get_areas_impl.dart';
import 'package:rrhh_clean/core/external/get_certificados_impl.dart';
import 'package:rrhh_clean/core/external/get_clasificadores_impl.dart';
import 'package:rrhh_clean/core/external/get_fuentes_impl.dart';
import 'package:rrhh_clean/core/external/get_metas_impl.dart';
import 'package:rrhh_clean/core/external/get_modalidades_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/auth/auth_module.dart';
import 'modules/auth/external/auth_dio_datasource_impl.dart';
import 'modules/start/start_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  final List<Bind> binds = [
    //Bind((i) => HttpCustom()),
    Bind((i) => DioCustom()),

    //AUTH

    //Bind((i) => AuthBloc(authCoreUseCase: i())),

    Bind((i) => LoginAuthUseCase(iAuthRepository: i())),
    Bind((i) => AuthRepositoyImpl(iAuthCoreDataSource: i())),
    //Bind((i) => AuthCoreDataSourceImpl()),
    Bind((i) => AuthDioDataSourceImpl()),

    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
    Bind((i) => GetClasificadoresImpl(httpCustom: i())),
    Bind((i) => GetCertificadosImpl(httpCustom: i())),
    Bind((i) => GetMetasImpl(httpCustom: i())),
    Bind((i) => GetAreasImpl(httpCustom: i())),
    Bind((i) => GetFuentesImpl(httpCustom: i())),
    Bind((i) => GetModalidadesImpl(httpCustom: i())),
    Bind((i) => GetClasificadoresUseCase(repositoryApp: i())),
    Bind((i) => GetCertificadosUseCase(repositoryApp: i())),
    Bind((i) => GetMetasUseCase(repositoryApp: i())),
    Bind((i) => RepositoryAppImpl(
          iDatasourceApp: i(),
          iMetasDatasourceApp: i(),
          iCertificadosDatasourceApp: i(),
          iAreasDatasourceApp: i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => SplashPage()),
    ModuleRoute('/login', module: AuthModule()),
    ModuleRoute('/start', module: StartModule()),
  ];
}
