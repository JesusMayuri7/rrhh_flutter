part of 'liquidacion_list_bloc.dart';

abstract class LiquidacionListState extends Equatable {
  const LiquidacionListState();
}

enum LiquidacionStatus {
  Initial,
  LiquidacionLoaded,
  LiquidacionDetalleLoaded,
  LiquidacionUpdated,
  LiquidacionDetalleUpdated,
  LiquidacionListError
}

class LiquidacionListInitial extends LiquidacionListState {
  @override
  List<Object> get props => [];
}

class LiquidacionListDetalleState extends LiquidacionListState {
  final String dscCertificado;
  final String nombres;
  final List<LiquidacionDetalleEntity> liquidacionDetalle;
  LiquidacionListDetalleState({
    required this.dscCertificado,
    required this.nombres,
    required this.liquidacionDetalle,
  });

  @override
  List<Object> get props => [this.nombres, this.liquidacionDetalle];
}

class LiquidacionListLoaded extends LiquidacionListState {
  final String modalidad;
  final String nombres;
  final String anio;
  final LiquidacionStatus status;
  final List<LiquidacionEntity> listLiquidacion;
  final List<LiquidacionEntity> listLiquidacionFiltered;
  // Detalle
  final List<LiquidacionDetalleEntity> liquidacionDetalle;
  // Resumen
  final List<LiquidacionResumenEntity> listLiquidacionResumen;
  final String dscCertificado;
  final String dscClasificador;
  final bool allClasificadores;

  LiquidacionListLoaded({
    required this.modalidad,
    this.nombres = '',
    required this.anio,
    this.status = LiquidacionStatus.Initial,
    required this.listLiquidacion,
    this.listLiquidacionFiltered = const [],
    this.liquidacionDetalle = const [],
    this.listLiquidacionResumen = const [],
    this.dscCertificado = '',
    this.dscClasificador = 'TODOS',
    this.allClasificadores = false,
  });
  @override
  List<Object> get props => [
        this.modalidad,
        this.nombres,
        this.anio,
        this.status,
        this.listLiquidacion,
        this.listLiquidacionFiltered,
        this.liquidacionDetalle,
        this.listLiquidacionResumen,
        this.dscCertificado,
        this.dscClasificador,
        this.allClasificadores,
      ];

  LiquidacionListLoaded copyWith(
      {String? modalidad,
      String? nombres,
      String? anio,
      LiquidacionStatus? status,
      List<LiquidacionEntity>? listLiquidacion,
      List<LiquidacionEntity>? listLiquidacionFiltered,
      List<LiquidacionDetalleEntity>? liquidacionDetalle,
      String? dscCertificado,
      String? dscClasificador,
      List<LiquidacionResumenEntity>? listLiquidacionResumen,
      bool? allClasificadores}) {
    return LiquidacionListLoaded(
        modalidad: modalidad ?? this.modalidad,
        nombres: nombres ?? this.nombres,
        anio: anio ?? this.anio,
        status: status ?? this.status,
        listLiquidacion: listLiquidacion ?? this.listLiquidacion,
        listLiquidacionFiltered:
            listLiquidacionFiltered ?? this.listLiquidacionFiltered,
        liquidacionDetalle: liquidacionDetalle ?? this.liquidacionDetalle,
        dscCertificado: dscCertificado ?? this.dscCertificado,
        dscClasificador: dscClasificador ?? this.dscClasificador,
        listLiquidacionResumen:
            listLiquidacionResumen ?? this.listLiquidacionResumen,
        allClasificadores: allClasificadores ?? this.allClasificadores);
  }
}
