part of 'new_judicial_bloc.dart';

abstract class NewJudicialEvent extends Equatable {
  const NewJudicialEvent();

  @override
  List<Object> get props => [];
}

class NewDocumentLoadEvent extends NewJudicialEvent {
  final ParamsNewJudicial paramsNewJudicial;

  NewDocumentLoadEvent({required this.paramsNewJudicial});
}
