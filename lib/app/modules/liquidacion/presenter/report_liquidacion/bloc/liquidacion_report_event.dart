// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'liquidacion_report_bloc.dart';

abstract class LiquidacionReportEvent extends Equatable {
  const LiquidacionReportEvent();
}

class LiquidacionReportLoad extends LiquidacionReportEvent {
  final String anio;
  final String dscModalidad;

  LiquidacionReportLoad({
    required this.anio,
    this.dscModalidad = 'CAS',
  });

  @override
  List<Object> get props => [this.anio, this.dscModalidad];
}

class LiquidacionReportFilter extends LiquidacionReportEvent {
  final String dscModalidad;
//  final int certificadoDevengadoId;

  LiquidacionReportFilter({
    this.dscModalidad = 'CAS',
    //  required this.certificadoDevengadoId,
  });

  @override
  List<Object> get props => [
        //this.certificadoDevengadoId,
        this.dscModalidad
      ];
}
