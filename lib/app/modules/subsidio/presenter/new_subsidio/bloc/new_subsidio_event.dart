part of 'new_subsidio_bloc.dart';

abstract class NewSubsidioEvent extends Equatable {
  const NewSubsidioEvent();

  @override
  List<Object> get props => [];
}

class AddSubsidioEvent extends NewSubsidioEvent {
  final ParamsNewSubsidio params;
  AddSubsidioEvent({
    required this.params,
  });
}
