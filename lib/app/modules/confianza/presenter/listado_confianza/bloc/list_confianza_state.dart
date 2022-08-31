part of 'list_confianza_bloc.dart';

abstract class ListConfianzaBlocState extends Equatable {
  const ListConfianzaBlocState();

  @override
  List<Object> get props => [];
}

enum StatusList { loading, loaded, failure, empty }

class ListConfianzaBlocInitial extends ListConfianzaBlocState {}

class ListConfianzaBlocLoading extends ListConfianzaBlocState {}

class ListConfianzaBlocError extends ListConfianzaBlocState {
  final String message;
  ListConfianzaBlocError({
    required this.message,
  });
}

class ListConfianzaBlocLoaded extends ListConfianzaBlocState {
  final StatusList status;
  final List<ConfianzaEntity> listConfianzaFiltered;
  final List<ConfianzaEntity> listConfianzaOriginal;

  ListConfianzaBlocLoaded(
      {required this.listConfianzaFiltered,
      required this.listConfianzaOriginal,
      this.status = StatusList.empty});

  @override
  List<Object> get props =>
      [this.listConfianzaOriginal, this.listConfianzaFiltered, this.status];

  ListConfianzaBlocLoaded copyWith({
    StatusList? status,
    List<ConfianzaEntity>? listConfianzaFiltered,
    List<ConfianzaEntity>? listConfianzaOriginal,
  }) {
    return ListConfianzaBlocLoaded(
      status: status ?? this.status,
      listConfianzaOriginal:
          listConfianzaOriginal ?? this.listConfianzaOriginal,
      listConfianzaFiltered:
          listConfianzaFiltered ?? this.listConfianzaFiltered,
    );
  }
}
