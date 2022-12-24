// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'liquidacion_report_bloc.dart';

abstract class LiquidacionReportState extends Equatable {
  const LiquidacionReportState();
}

class LiquidacionReportLoaded extends LiquidacionReportState {
  final List<LiquidacionReportEntity> liquidacionReport;
  final List<LiquidacionReportEntity> liquidacionReportFiltered;
  final String dscModalidad;

  LiquidacionReportLoaded({
    this.liquidacionReport = const [],
    this.liquidacionReportFiltered = const [],
    this.dscModalidad = 'CAS',
  });
  @override
  List<Object> get props => [
        this.liquidacionReport,
        this.liquidacionReportFiltered,
        this.dscModalidad
      ];

  LiquidacionReportLoaded copyWith({
    List<LiquidacionReportEntity>? liquidacionReport,
    List<LiquidacionReportEntity>? liquidacionReportFiltered,
    String? dscModalidad,
  }) {
    return LiquidacionReportLoaded(
      liquidacionReport: liquidacionReport ?? this.liquidacionReport,
      liquidacionReportFiltered:
          liquidacionReportFiltered ?? this.liquidacionReportFiltered,
      dscModalidad: dscModalidad ?? this.dscModalidad,
    );
  }
}

class LiquidacionReportError extends LiquidacionReportState {
  final String message;
  LiquidacionReportError({
    required this.message,
  });
  @override
  List<Object> get props => [this.message];
}

class LiquidacionReportLoading extends LiquidacionReportState {
  @override
  List<Object?> get props => [];
}
