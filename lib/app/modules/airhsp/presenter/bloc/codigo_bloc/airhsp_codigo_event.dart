// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'airhsp_codigo_bloc.dart';

abstract class AirhspCodigoEvent extends Equatable {
  const AirhspCodigoEvent();
}

class LoadingCodigoEvent extends AirhspCodigoEvent {
  List<Object?> get props => [];
}

class LoadedCodigoEvent extends AirhspCodigoEvent {
  final ParamsCodigo paramsCodigo;  
  
  LoadedCodigoEvent({
    required this.paramsCodigo,  
  });

  @override
  List<Object> get props => [this.paramsCodigo];
}

class SelectedCodigoEvent extends AirhspCodigoEvent {
  final AirhspCodigo airhspCodigo;  
  
  SelectedCodigoEvent({
    required this.airhspCodigo,  
  });

  @override
  List<Object> get props => [this.airhspCodigo];
}




