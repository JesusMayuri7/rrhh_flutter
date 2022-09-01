// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

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
    var result = await this
        .importFileUseCase(ParamsInportFile(anio: '2022', bytes: event.bytes));
    emit(result.fold((l) {
      print('error ' + l.toString());
      return ImportLoadError(message: 'error');
    }, (r) {
      print('bien ' + r.data.toString());
      return ImportLoadError(message: 'aca');
    }));
  }

  _importLoad(ImportLoad event, Emitter<ImportState> emit) async* {
    emit(ImportLoaded(list: event.list));
    //if (event is Import) yield ImportLoaded(list: event.list);
  }
}
