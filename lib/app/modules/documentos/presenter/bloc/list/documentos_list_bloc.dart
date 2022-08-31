import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rrhh_clean/app/modules/documentos/domain/documento_entity.dart';
import 'package:rrhh_clean/app/modules/documentos/domain/documentos_list_usecase.dart';

part 'documentos_list_event.dart';
part 'documentos_list_state.dart';

class DocumentosListBloc
    extends Bloc<DocumentosListEvent, DocumentosListState> {
  final DocumentosListUseCase documentosListUseCase;

  DocumentosListBloc({required this.documentosListUseCase})
      : super(DocumentosListInitial()) {
    on<DocumentosListEvent>(_onDocumentoListLoadToState);
  }
  _onDocumentoListLoadToState(
      DocumentosListEvent event, Emitter<DocumentosListState> emit) async {    
    var result =
        await this.documentosListUseCase(ParamsDocumentos(anio: '2022'));
    emit(result.fold((l) => DocumentosListError(message: l.toString()), (r) {
      
      return DocumentosListLoaded(documentosList: r.data);
    }));
  }
}
