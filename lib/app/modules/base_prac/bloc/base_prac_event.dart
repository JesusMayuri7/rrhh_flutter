part of 'base_prac_bloc.dart';

abstract class BasePracEvent extends Equatable {
  const BasePracEvent();

  @override
  List<Object> get props => [];
}

class BasePracLoadedEvent extends BasePracEvent {}
