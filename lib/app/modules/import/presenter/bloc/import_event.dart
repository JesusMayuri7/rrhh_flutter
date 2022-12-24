part of 'import_bloc.dart';

abstract class ImportEvent extends Equatable {
  const ImportEvent();

  @override
  List<Object> get props => [];
}

class ImportLoad extends ImportEvent {
  final List<List<Object>> list;
  ImportLoad({
    required this.list,
  });
}

class ImportLoadFile extends ImportEvent {
  final File bytes;
  ImportLoadFile({
    required this.bytes,
  });
}

class ImportExport extends ImportEvent {
  final List<List<Object>> list;
  ImportExport({
    required this.list,
  });
}

class ImportLoadingEvent extends ImportEvent {}
