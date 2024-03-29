// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'judiciales_list_bloc.dart';

abstract class JudicialesListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class JudicialesListLoad extends JudicialesListEvent {
  final String anio;
  JudicialesListLoad({required this.anio});

}

class JudicialesListFilter extends JudicialesListEvent {
  final String criterio;
  JudicialesListFilter({required this.criterio});

  @override
  List<Object> get props => [this.criterio];
}

class JudicialesListSetDetailEvent extends JudicialesListEvent {
  final List<JudicialDetailEntity> judicialesEntity;
  final int judicialId;
  final String nombres;
  JudicialesListSetDetailEvent({
    required this.judicialesEntity,
    required this.judicialId,
    required this.nombres,
  });

   @override
  List<Object> get props => [this.judicialesEntity,this.judicialId,this.nombres];
}
