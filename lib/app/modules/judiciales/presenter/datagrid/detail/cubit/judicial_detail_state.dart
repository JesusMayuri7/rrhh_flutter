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

class JudicialDetailLoaded extends JudicialDetailState {
  JudicialDetailLoaded({required super.judicialDetailList});
  
}
