part of 'liquidacion_report_bloc.dart';

abstract class LiquidacionReportEvent extends Equatable {
  const LiquidacionReportEvent();
}

class LiquidacionReportLoad extends LiquidacionReportEvent {
  final String anio;

  LiquidacionReportLoad({
    required this.anio,
  });

  @override
  List<Object> get props => [this.anio];
}

class LiquidacionReportFilter extends LiquidacionReportEvent {
  final int certificadoDevengadoId;

  LiquidacionReportFilter({
    required this.certificadoDevengadoId,
  });

  @override
  List<Object> get props => [this.certificadoDevengadoId];
}
