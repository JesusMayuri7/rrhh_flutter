// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'judicial_detail_cubit.dart';

abstract class JudicialDetailEvent {
  @override
  List<Object> get props => [];
}

class JudicialDetailInitialEvent extends JudicialDetailEvent {}

class JudicialDetailLoadedEvent extends JudicialDetailEvent {
  final List<JudicialDetailEntity> judicialDetailEntity;
  final int judicialId;
  JudicialDetailLoadedEvent({
    required this.judicialDetailEntity,
    required this.judicialId,
  });

  @override
  List<Object> get props => [this.judicialDetailEntity, this.judicialId];
}

class JudicialNewDetailEvent extends JudicialDetailEvent {
  final ParamsNewJudicialDetail paramsNewJudicialDetail;
  JudicialNewDetailEvent({
    required this.paramsNewJudicialDetail,
  });
}
