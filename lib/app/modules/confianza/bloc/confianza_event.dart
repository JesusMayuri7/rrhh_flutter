part of 'confianza_bloc.dart';

abstract class ConfianzaEvent extends Equatable {
  const ConfianzaEvent();

  @override
  List<Object> get props => [];
}

class ConfianzaAreaEventLoading implements ConfianzaEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
