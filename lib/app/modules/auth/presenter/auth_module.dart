import 'package:flutter_modular/flutter_modular.dart';

//import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/core/auth/auth_core_datasource_impl.dart';
import 'package:rrhh_clean/core/auth/auth_repository_impl.dart';

import 'package:rrhh_clean/core/auth/login_auth_usecase.dart';

import 'bloc/auth_bloc.dart';
import 'login_auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // BLOC
    Bind((i) => AuthBloc(authCoreUseCase: i())),

    // USES CASE
    Bind((i) => LoginAuthUseCase(iAuthRepository: i())),

    //DATASOURCE
    Bind((i) => AuthCoreDataSourceImpl()),

    //REPOSITORY
    Bind((i) => AuthRepositoyImpl(iAuthCoreDataSource: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}
