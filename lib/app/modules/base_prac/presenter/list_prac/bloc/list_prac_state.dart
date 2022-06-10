part of 'list_prac_bloc.dart';

abstract class ListPracState extends Equatable {
  const ListPracState();
}

class ListPracLoading extends ListPracState {
  @override
  List<Object> get props => [];
}

class ListPracLoaded extends ListPracState {
  final List<PracticanteEntity> listPracticanteFiltered;
  final List<PracticanteEntity> listPracticanteOriginal;

  ListPracLoaded({
    this.listPracticanteFiltered = const [],
    this.listPracticanteOriginal = const [],
  });

  @override
  List<Object> get props =>
      [this.listPracticanteFiltered, this.listPracticanteOriginal];

  ListPracLoaded copyWith({
    List<PracticanteEntity>? listPracticanteFiltered,
    List<PracticanteEntity>? listPracticanteOriginal,
  }) {
    return ListPracLoaded(
      listPracticanteFiltered:
          listPracticanteFiltered ?? this.listPracticanteFiltered,
      listPracticanteOriginal:
          listPracticanteOriginal ?? this.listPracticanteOriginal,
    );
  }
}

class ErrorPracLoaded extends ListPracState {
  final String message;
  ErrorPracLoaded({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
