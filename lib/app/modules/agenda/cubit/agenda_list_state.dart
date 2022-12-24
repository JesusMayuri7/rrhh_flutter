// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'agenda_list_cubit.dart';

abstract class AgendaListState extends Equatable {
  const AgendaListState();

  @override
  List<Object> get props => [];
}

class AgendaListInitial extends AgendaListState {}

class AgendaListError extends AgendaListState {
  final String message;
  AgendaListError({
    required this.message,
  });
}

class AgendaListLoaded extends AgendaListState {
  final List<AgendaEntity> listAgendaFiltered;
  final List<AgendaEntity> listAgendaOriginal;

  AgendaListLoaded({
    required this.listAgendaFiltered,
    required this.listAgendaOriginal,
  });

  AgendaListLoaded copyWith({
    List<AgendaEntity>? listAgendaFiltered,
    List<AgendaEntity>? listAgendaOriginal,
  }) {
    return AgendaListLoaded(
      listAgendaFiltered: listAgendaFiltered ?? this.listAgendaFiltered,
      listAgendaOriginal: listAgendaOriginal ?? this.listAgendaOriginal,
    );
  }

  @override
  List<Object> get props => [listAgendaFiltered, listAgendaOriginal];
}
