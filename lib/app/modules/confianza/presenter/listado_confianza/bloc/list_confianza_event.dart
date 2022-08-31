part of 'list_confianza_bloc.dart';

abstract class ListConfianzaBlocEvent extends Equatable {
  const ListConfianzaBlocEvent();

  @override
  List<Object> get props => [];
}

class ListConfianzaEventGet extends ListConfianzaBlocEvent {
  final String anio;
  ListConfianzaEventGet({
    required this.anio,
  });
}

class ListConfianzaEventFilter extends ListConfianzaBlocEvent {
  final String textFilter;
  ListConfianzaEventFilter({
    required this.textFilter,
  });
  @override
  List<Object> get props => [this.textFilter];
}

class ListConfianzaEventUpdate extends ListConfianzaBlocEvent {
  final List<ConfianzaEntity> listConfianza;

  ListConfianzaEventUpdate({required this.listConfianza});

  @override
  List<Object> get props => [this.listConfianza];
}

class ConfianzaEventEditSaved extends ListConfianzaBlocEvent {
  final ConfianzaEntity confianzaEntity;

  ConfianzaEventEditSaved({required this.confianzaEntity});

  @override
  List<Object> get props => [this.confianzaEntity];
}

class ConfianzaEventEditCreate extends ListConfianzaBlocEvent {
  final ConfianzaEntity confianzaEntity;

  ConfianzaEventEditCreate({required this.confianzaEntity});

  @override
  List<Object> get props => [this.confianzaEntity];
}
