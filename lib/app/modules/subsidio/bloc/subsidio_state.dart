part of 'subsidio_bloc.dart';

abstract class SubsidioState extends Equatable {
  const SubsidioState();
}

class SubsidioError extends SubsidioState {
  final String message;
  SubsidioError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class SubsidioInitial extends SubsidioState {
  @override
  List<Object> get props => [];
}

class SubsidioLoading extends SubsidioState {
  @override
  List<Object> get props => [];
}

class SubsidioLoaded extends SubsidioState {
  final List<CertificadoEntity> certificados;
  final List<MetaEntity> metas;
  final List<ClasificadorEntity> clasificadores;
  final List<FuenteEntity> fuentes;
  SubsidioLoaded({
    required this.certificados,
    required this.metas,
    required this.clasificadores,
    required this.fuentes,
  });

  @override
  List<Object> get props =>
      [this.certificados, this.metas, this.clasificadores, this.fuentes];
}
