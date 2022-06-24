import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/reports/airhsp/data/reports_airhsp_repository.dart';
import 'package:rrhh_clean/app/modules/reports/airhsp/external/get_download_datasource_impl.dart';
import 'package:rrhh_clean/app/modules/reports/airhsp/presenter/cubit/reports_airhsp_cubit.dart';
import 'package:rrhh_clean/app/modules/reports/reports_main_page.dart';

import 'airhsp/domain/get_download_use_case.dart';

class ReportsModule extends Module {
  @override
  final List<Bind> binds = [
    //DataSource
    Bind.factory((i) => GetDownloadDatasourceImpl(iClientCustom: i())),
    Bind.factory(
        (i) => ReportsAirhspRepositoryImpl(iGetDownloadDatasource: i())),
    Bind.factory(
        (i) => GetReportsAirshpDownloadUseCase(iReportsAirhspRepository: i())),
    Bind.singleton((i) => ReportsAirhspCubit(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ReportsMainPage())
  ];
}
