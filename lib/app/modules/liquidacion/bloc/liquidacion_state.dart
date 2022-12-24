// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final List<FuenteEntity> fuentes;
  LiquidacionLoadedState({
    this.metas = const [],
    this.certificados = const [],
    this.clasificadores = const [],
    this.fuentes = const [],
  });

  @override
  List<Object> get props =>
      [this.metas, this.certificados, this.clasificadores, this.fuentes];

  LiquidacionLoadedState copyWith({
    String? dscCertificado,
    List<MetaEntity>? metas,
    List<CertificadoEntity>? certificados,
    List<ClasificadorEntity>? clasificadores,
    List<FuenteEntity>? fuentes,
  }) {
    return LiquidacionLoadedState(
      metas: metas ?? this.metas,
      certificados: certificados ?? this.certificados,
      clasificadores: clasificadores ?? this.clasificadores,
      fuentes: fuentes ?? this.fuentes,
    );
  }

  @override
  String toString() {
    return 'LiquidacionLoadedState(metas: $metas, certificados: $certificados, clasificadores: $clasificadores, fuentes: $fuentes)';
  }
}

class LiquidacionError extends LiquidacionState {
  final String message;
  LiquidacionError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
