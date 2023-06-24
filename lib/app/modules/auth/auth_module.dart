import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/core/config/dio_custom.dart';

import 'data/auth_repository_impl.dart';
import 'domain/login_auth_usecase.dart';
import 'external/auth_dio_datasource_impl.dart';
import 'external/auth_http_datasource_impl.dart';
import 'external/auth_httpclient_datasource_impl.dart';
import 'presenter/bloc/auth_bloc.dart';
import 'presenter/login_auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // BLOC
    Bind((i) => AuthBloc(authCoreUseCase: i(), appService: i())),

    // USES CASE
    Bind((i) => LoginAuthUseCase(iAuthRepository: i())),

    //REPOSITORY
    Bind((i) => AuthRepositoyImpl(iAuthCoreDataSource: i())),

    //DATASOURCE
    Bind((i) => AuthHttpClientDataSourceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}
