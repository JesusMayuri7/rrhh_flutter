import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/documentos/domain/documento_entity.dart';
import 'package:rrhh_clean/app/modules/documentos/domain/new_documentos_use_case.dart';

part 'new_documento_event.dart';
part 'new_documento_state.dart';

class NewDocumentoBloc extends Bloc<NewDocumentoEvent, NewDocumentoState> {
  NewDocumentoUseCase newDocumentoUseCase;

  NewDocumentoBloc({required this.newDocumentoUseCase})
      : super(NewDocumentoInitial()) {
    on<NewDocumentLoadEvent>(_newDocumentoLoadEvent);
  }

  FutureOr<void> _newDocumentoLoadEvent(
      NewDocumentLoadEvent event, Emitter<NewDocumentoState> emit) async {
    var result = await this.newDocumentoUseCase(event.paramsNewDocumento);
    emit(result.fold((l) => NewDocumentoError(message: l.toString()), (r) {
      print('new documento' + r.data.toString());
      return NewDocumentoSaved(documentoEntity: r.data);
    }));
  }
}
