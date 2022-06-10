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
  final List<ConfianzaEntity> listConfianza;

  ListConfianzaBlocLoaded(
      {required this.listConfianza, this.status = StatusList.empty});

  @override
  List<Object> get props => [this.listConfianza];

  ListConfianzaBlocLoaded copyWith({
    StatusList? status,
    List<ConfianzaEntity>? listConfianza,
  }) {
    return ListConfianzaBlocLoaded(
      status: status ?? this.status,
      listConfianza: listConfianza ?? this.listConfianza,
    );
  }
}
