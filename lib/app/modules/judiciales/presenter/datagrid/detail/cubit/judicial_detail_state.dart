part of 'judicial_detail_cubit.dart';

abstract class JudicialDetailState extends Equatable {
  JudicialDetailState({required this.judicialDetailList});

  final List<JudicialDetailEntity> judicialDetailList; 


  @override
  List<Object> get props => [judicialDetailList];
}

class JudicialDetailInitial extends JudicialDetailState {
  JudicialDetailInitial({required super.judicialDetailList});  
}

class JudicialDetailSaved extends JudicialDetailState {
  JudicialDetailSaved({required super.judicialDetailList});  
}

class JudicialDetailError extends JudicialDetailState {
  JudicialDetailError({required super.judicialDetailList, required this.message});  
  final String message;
}

class JudicialDetailLoaded extends JudicialDetailState {
  JudicialDetailLoaded({required super.judicialDetailList, required this.judicialId});
  final int judicialId;

  @override
  List<Object> get props => [this.judicialDetailList,this.judicialId];
  
}
