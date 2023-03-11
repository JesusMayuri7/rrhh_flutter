// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class JudicialesListSetDetail extends JudicialesListState {

  final List<JudicialDetailEntity> judicialDetailEntity;
  final int judicialId;
  JudicialesListSetDetail({
    required this.judicialDetailEntity,
    required this.judicialId,
  });

  @override
  List<Object> get props => [this.judicialDetailEntity,this.judicialId];
}

class JudicialesListError extends JudicialesListState {
  final String message;

  JudicialesListError({required this.message});

  @override
  List<Object> get props => [this.message];
}

class JudicialesListLoaded extends JudicialesListState {
  final List<JudicialEntity> judicialesListOriginal;
  final List<JudicialEntity> judicialesListFiltered;
  JudicialesListLoaded({
    required this.judicialesListOriginal,
    required this.judicialesListFiltered,
  });
  @override
  List<Object> get props =>
      [this.judicialesListOriginal, this.judicialesListFiltered];

  JudicialesListLoaded copyWith({
    List<JudicialEntity>? judicialesListOriginal,
    List<JudicialEntity>? judicialesListFiltered,
  }) {
    return JudicialesListLoaded(
      judicialesListOriginal:
          judicialesListOriginal ?? this.judicialesListOriginal,
      judicialesListFiltered:
          judicialesListFiltered ?? this.judicialesListFiltered,
    );
  }
}
