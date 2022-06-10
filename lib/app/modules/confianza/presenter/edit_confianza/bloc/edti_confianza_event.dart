part of 'edti_confianza_bloc.dart';

abstract class EdtiConfianzaEvent extends Equatable {
  const EdtiConfianzaEvent();

  @override
  List<Object> get props => [];
}

class EditConfianzaEventPost extends EdtiConfianzaEvent {
  final ConfianzaEntity confianza;
  EditConfianzaEventPost({
    required this.confianza,
  });
}
