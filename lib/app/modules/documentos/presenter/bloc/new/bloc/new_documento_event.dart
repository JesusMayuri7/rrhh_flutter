part of 'new_documento_bloc.dart';

abstract class NewDocumentoEvent extends Equatable {
  const NewDocumentoEvent();

  @override
  List<Object> get props => [];
}

class NewDocumentLoadEvent extends NewDocumentoEvent {
  final ParamsNewDocumento paramsNewDocumento;

  NewDocumentLoadEvent({required this.paramsNewDocumento});
}
