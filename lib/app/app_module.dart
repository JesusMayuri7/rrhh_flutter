import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/core/external/get_tipo_requerimiento_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/app/splash_page.dart';
import 'package:rrhh_clean/core/config/dio_custom.dart';
import 'modules/auth/auth_module.dart';
import 'modules/start/start_module.dart';
import 'app_service.dart';

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

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
    Bind.lazySingleton<AppService>((i) => AppService(preferences: i())..init()),
    Bind.singleton((i) => DioCustom()),
    Bind((i) => LoginAuthUseCase(iAuthRepository: i())),
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
   Bind((i) => GetTipoRequerimientoImpl(httpCustom: i()))

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => SplashPage()),
    ModuleRoute('/login/', module: AuthModule()),
    ModuleRoute('/start/', module: StartModule()),
  ];
}
