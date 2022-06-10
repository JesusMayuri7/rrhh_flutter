part of 'liquidacion_report_bloc.dart';

abstract class LiquidacionReportState extends Equatable {
  const LiquidacionReportState();
}

class LiquidacionReportLoaded extends LiquidacionReportState {
  final List<LiquidacionReportEntity> liquidacionReport;
  final List<LiquidacionReportEntity> liquidacionReportFiltered;

  LiquidacionReportLoaded({
    this.liquidacionReport = const [],
    this.liquidacionReportFiltered = const [],
  });
  @override
  List<Object> get props =>
      [this.liquidacionReport, this.liquidacionReportFiltered];

  LiquidacionReportLoaded copyWith({
    List<LiquidacionReportEntity>? liquidacionReport,
    List<LiquidacionReportEntity>? liquidacionReportFiltered,
  }) {
    return LiquidacionReportLoaded(
      liquidacionReport: liquidacionReport ?? this.liquidacionReport,
      liquidacionReportFiltered:
          liquidacionReportFiltered ?? this.liquidacionReportFiltered,
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
