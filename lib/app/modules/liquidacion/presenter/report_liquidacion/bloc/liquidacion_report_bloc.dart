import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_report_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/get_liquidacion_report_usecase.dart';

part 'liquidacion_report_event.dart';
part 'liquidacion_report_state.dart';

class LiquidacionReportBloc
    extends Bloc<LiquidacionReportEvent, LiquidacionReportState> {
  LiquidacionReportBloc({required this.getLiquidacionReportUseCase})
      : super(LiquidacionReportLoaded()) {
    on<LiquidacionReportLoad>(_onLiquidacionReportEventToState);
    on<LiquidacionReportFilter>(_onLiquidacionReportFilterEventToState);
  }

  final GetLiquidacionReportUseCase getLiquidacionReportUseCase;

  _onLiquidacionReportEventToState(
      LiquidacionReportLoad event, Emitter<LiquidacionReportState> emit) async {
    emit(LiquidacionReportLoading());
    var responseLiquidacionReport =
        await this.getLiquidacionReportUseCase(event.anio);
    emit(responseLiquidacionReport.fold((l) {
      print(l.toString());
      return LiquidacionReportError(message: l.toString());
    }, (r) {
      // print(r.data.toString());
      return LiquidacionReportLoaded(
          liquidacionReport: r.data, liquidacionReportFiltered: r.data);
    }));
  }

  _onLiquidacionReportFilterEventToState(
      event, Emitter<LiquidacionReportState> emit) async {
    emit((state as LiquidacionReportLoaded).copyWith(
        liquidacionReportFiltered: (state as LiquidacionReportLoaded)
            .liquidacionReport
            .where((element) =>
                element.certificadoDevengadoId == event.certificadoDevengadoId)
            .toList()));
  }
}
