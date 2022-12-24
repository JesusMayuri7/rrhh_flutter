// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';

part 'import_event.dart';
part 'import_state.dart';

class ImportBloc extends Bloc<ImportEvent, ImportState> {
  ImportBloc(
    this.importFileUseCase,
  ) : super(ImportInitial()) {
    on<ImportLoad>(_importLoad);
    on<ImportLoadFile>(_importLoadFile);
  }

  final ImportFileUseCase importFileUseCase;

  _importLoadFile(ImportLoadFile event, Emitter<ImportState> emit) async {
    emit(ImportFileLoading());
    var result = await this
        .importFileUseCase(ParamsInportFile(anio: '2022', bytes: event.bytes));
    emit(result.fold((l) {
      return ImportLoadError(message: 'Error al importar');
    }, (r) {
      return ImportFileLoaded(message: r.message);
    }));
  }

  _importLoad(ImportLoad event, Emitter<ImportState> emit) async* {
    emit(ImportListLoaded(list: event.list));
    //if (event is Import) yield ImportLoaded(list: event.list);
  }
}
