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
    on<DocumentosListLoad>(_onDocumentoListLoadToState);
    on<DocumentosListFilterEvent>(_onDocumentoListFilterToState);
  }
  _onDocumentoListLoadToState(
      DocumentosListLoad event, Emitter<DocumentosListState> emit) async {
    var result =
        await this.documentosListUseCase(ParamsDocumentos(anio: '2022'));
    emit(result.fold((l) => DocumentosListError(message: l.toString()), (r) {
      List<DocumentoEntity> result = (r.data as List<DocumentoEntity>)
          .where((element) =>
              (element.control == 'EXTERNO' && element.estado == 'PENDIENTE'))
          .toList();
      return DocumentosListLoaded(
          documentosListOriginal: r.data, documentosListFiltered: result);
    }));
  }

  _onDocumentoListFilterToState(DocumentosListFilterEvent event,
      Emitter<DocumentosListState> emit) async {
    if (state is DocumentosListLoaded) {
      List<DocumentoEntity> result = (state as DocumentosListLoaded)
          .documentosListOriginal
          .where((element) =>
              element.control == event.control &&
              element.estado == event.estado)
          .toList();

      emit((state as DocumentosListLoaded)
          .copyWith(documentosListFiltered: result));
    }
  }
}
