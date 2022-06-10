part of 'new_subsidio_bloc.dart';

abstract class NewSubsidioState extends Equatable {
  const NewSubsidioState();
}

class NewSubsidioInitial extends NewSubsidioState {
  @override
  List<Object> get props => [];
}

class NewSubsidioAdded extends NewSubsidioState {
  final SubsidioDevolucionEntity subsidioDevolucionEntity;
  NewSubsidioAdded({
    required this.subsidioDevolucionEntity,
  });
  @override
  List<Object> get props => [this.subsidioDevolucionEntity];

  NewSubsidioAdded copyWith({
    SubsidioDevolucionEntity? subsidioDevolucionEntity,
  }) {
    return NewSubsidioAdded(
      subsidioDevolucionEntity:
          subsidioDevolucionEntity ?? this.subsidioDevolucionEntity,
    );
  }
}

class NewSubsidioError extends NewSubsidioState {
  final String message;
  NewSubsidioError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
