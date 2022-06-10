import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'import_event.dart';
part 'import_state.dart';

class ImportBloc extends Bloc<ImportEvent, ImportState> {
  ImportBloc() : super(ImportInitial());

  @override
  Stream<ImportState> mapEventToState(
    ImportEvent event,
  ) async* {
    if (event is ImportLoad) yield ImportLoaded(list: event.list);
    //if (event is Import) yield ImportLoaded(list: event.list);
  }
}
