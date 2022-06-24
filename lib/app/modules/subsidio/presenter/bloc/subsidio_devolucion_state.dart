part of 'subsidio_devolucion_bloc.dart';

abstract class SubsidioDevolucionState extends Equatable {
  const SubsidioDevolucionState();
}

class SubsidioDevolucionInitial extends SubsidioDevolucionState {
  @override
  List<Object?> get props => [];
}

class SubsidioDevolucionLoading extends SubsidioDevolucionState {
  @override
  List<Object?> get props => [];
}

class SubsidioDevolucionLoaded extends SubsidioDevolucionState {
  final String modalidad;
  final List<SubsidioDevolucionEntity> subsidioDevolucionList;
  final List<SubsidioDevolucionEntity> subsidioDevolucionFiltered;

  SubsidioDevolucionLoaded({
    required this.modalidad,
    required this.subsidioDevolucionList,
    required this.subsidioDevolucionFiltered,
  });

  @override
  List<Object> get props => [
        this.subsidioDevolucionList,
        this.subsidioDevolucionFiltered,
        this.modalidad
      ];

  SubsidioDevolucionLoaded copyWith({
    String? modalidad,
    List<SubsidioDevolucionEntity>? subsidioDevolucionList,
    List<SubsidioDevolucionEntity>? subsidioDevolucionFiltered,
  }) {
    return SubsidioDevolucionLoaded(
      modalidad: modalidad ?? this.modalidad,
      subsidioDevolucionList:
          subsidioDevolucionList ?? this.subsidioDevolucionList,
      subsidioDevolucionFiltered:
          subsidioDevolucionFiltered ?? this.subsidioDevolucionFiltered,
    );
  }
}

class SubsidioDevolucionError extends SubsidioDevolucionState {
  final String message;
  SubsidioDevolucionError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
