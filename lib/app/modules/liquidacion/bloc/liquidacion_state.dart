part of 'liquidacion_bloc.dart';

abstract class LiquidacionState extends Equatable {
  const LiquidacionState();
}

class LiquidacionLoadingState extends LiquidacionState {
  @override
  List<Object> get props => [];
}

class LiquidacionInitalState extends LiquidacionState {
  @override
  List<Object> get props => [];
}

class LiquidacionLoadedState extends LiquidacionState {
  final List<MetaEntity> metas;
  final List<CertificadoEntity> certificados;
  final List<ClasificadorEntity> clasificadores;
  LiquidacionLoadedState({
    this.metas = const [],
    this.certificados = const [],
    this.clasificadores = const [],
  });

  @override
  List<Object> get props =>
      [this.metas, this.certificados, this.clasificadores];

  LiquidacionLoadedState copyWith(
      {String? dscCertificado,
      List<MetaEntity>? metas,
      List<CertificadoEntity>? certificados,
      List<ClasificadorEntity>? clasificadores}) {
    return LiquidacionLoadedState(
        metas: metas ?? this.metas,
        certificados: certificados ?? this.certificados,
        clasificadores: clasificadores ?? this.clasificadores);
  }

  @override
  String toString() =>
      'LiquidacionDataInitial( metas: $metas, certificados: $certificados, clasificadores : $clasificadores)';
}

class LiquidacionError extends LiquidacionState {
  final String message;
  LiquidacionError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
