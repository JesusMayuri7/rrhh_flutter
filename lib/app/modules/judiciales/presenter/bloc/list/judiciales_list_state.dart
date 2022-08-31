part of 'judiciales_list_bloc.dart';

abstract class JudicialesListState extends Equatable {
  const JudicialesListState();
  @override
  List<Object> get props => [];
}

class JudicialesListInitial extends JudicialesListState {
  @override
  List<Object> get props => [];
}

class JudicialesListLoading extends JudicialesListState {
  @override
  List<Object> get props => [];
}

class JudicialesListError extends JudicialesListState {
  final String message;

  JudicialesListError({required this.message});

  @override
  List<Object> get props => [this.message];
}

class JudicialesListLoaded extends JudicialesListState {
  final List<JudicialEntity> judicialesList;
  JudicialesListLoaded({
    required this.judicialesList,
  });
  @override
  List<Object> get props => [this.judicialesList];
}
