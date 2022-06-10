import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/bloc/app_bloc.dart';

import 'package:rrhh_clean/app/modules/base_prac/basePrac_module.dart';
import 'package:rrhh_clean/app/modules/home/home_module.dart';
import 'package:rrhh_clean/app/modules/import/import_module.dart';
import 'package:rrhh_clean/app/modules/requerimientos/requerimientos_module.dart';
import 'package:rrhh_clean/app/modules/start/start_fluent.dart';
import 'package:rrhh_clean/app/modules/subsidio/subsidio_module.dart';

import '../airhsp/airhsp_module.dart';
import '../base_cap/base_cap_module.dart';
import '../base_cas/base_cas_module.dart';

//import 'bloc/start_bloc.dart';
import 'package:rrhh_clean/app/modules/certificados/certificados_module.dart';
import 'package:rrhh_clean/app/modules/confianza/confianza_module.dart';
import 'package:rrhh_clean/app/modules/liquidacion/liquidacion_module.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => StartFluent(), children: [
      ModuleRoute('/home', module: HomeModule()),
      ModuleRoute('/base_prac', module: BasePracModule()),
      ModuleRoute('/base_cas', module: BaseCasModule()),
      ModuleRoute('/base_cap', module: BaseCapModule()),
      ModuleRoute('/airhsp', module: AirhspModule()),
      ModuleRoute('/certificados', module: CertificadosModule()),
      ModuleRoute('/confianza', module: ConfianzaModule()),
      ModuleRoute('/liquidacion', module: LiquidacionModule()),
      ModuleRoute('/subsidio', module: SubsidioModule()),
      ModuleRoute('/requerimientos', module: RequerimientosModule()),
      ModuleRoute('/import', module: ImportModule()),
      //ModuleRoute('/login', module: AuthModule()),
    ]),
  ];
}
