import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/reports/airhsp/domain/get_download_use_case.dart';
part 'report_airhsp_state.dart';

class ReportsAirhspCubit extends Cubit<ReportAirhspState> {
  ReportsAirhspCubit(
    this.getReportsAirshpDownloadUseCase,
  ) : super(ReportAirhspInitial());

  final GetReportsAirshpDownloadUseCase getReportsAirshpDownloadUseCase;

  void getDownloadFile() {}
}
