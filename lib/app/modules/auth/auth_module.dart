import 'package:flutter_modular/flutter_modular.dart';

//import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/auth/external/auth_http_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/auth/data/auth_repository_impl.dart';

import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';

import 'presenter/bloc/auth_bloc.dart';
import 'presenter/login_auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // BLOC
    Bind((i) => AuthBloc(authCoreUseCase: i()), export: true),

    // USES CASE
    Bind((i) => LoginAuthUseCase(iAuthRepository: i())),

    //DATASOURCE
    Bind((i) => AuthHttpDataSourceImpl()),

    //REPOSITORY
    Bind((i) => AuthRepositoyImpl(iAuthCoreDataSource: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}
